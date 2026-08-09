#include <iostream>
#include "ap_int.h"
#include "hls_stream.h"
#include "../hls/sparse_gemv.h"

int main() {
    hls::stream<ap_int<8>> in_strm("in_strm");
    hls::stream<ap_uint<1>> mask_strm("mask_strm");
    hls::stream<ap_int<32>> out_strm("out_strm");
    
    int weights[N][N];
    int input_vec[N];
    int mask_vec[N];
    int expected_out[N];
    int errors = 0;
    
    // 1. Initialize weights, inputs, and masks (50% sparsity)
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            weights[i][j] = (i + j) % 5;
        }
        
        // Make every even index a non-zero number, every odd index zero
        if (i % 2 == 0) {
            input_vec[i] = i % 10; // Non-zero
            mask_vec[i] = 1;       // Do the math
        } else {
            input_vec[i] = 0;      // Zero
            mask_vec[i] = 0;       // Skip the math
        }
    }
    
    // 2. Feed the input stream and bitmask stream
    for(int i = 0; i < N; i++) {
        in_strm.write(input_vec[i]);
        mask_strm.write(mask_vec[i]);
    }
    
    // 3. Calculate expected output (skipping zeros in software)
    for(int i = 0; i < N; i++) {
        int sum = 0;
        for(int j = 0; j < N; j++) {
            if (mask_vec[j] == 1) {
                sum += input_vec[j] * weights[i][j];
            }
        }
        expected_out[i] = sum;
    }
    
    // 4. Run the hardware function
    sparse_gemv(in_strm, mask_strm, weights, out_strm, N);
    
    // 5. Check the results
    for(int i = 0; i < N; i++) {
        ap_int<32> result = out_strm.read();
        std::cout << "Row " << i << " | Expected: " << expected_out[i] << " | Got: " << result;
        if(result == expected_out[i]) {
            std::cout << " (PASS)" << std::endl;
        } else {
            std::cout << " (FAIL)" << std::endl;
            errors++;
        }
    }
    
    if(errors == 0) {
        std::cout << "\n--- ALL TESTS PASSED (50% Sparsity) ---" << std::endl;
        return 0;
    } else {
        std::cout << "\n--- TESTS FAILED ---" << std::endl;
        return 1;
    }
}