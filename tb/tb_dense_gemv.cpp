#include <iostream>
#include "ap_int.h"
#include "hls_stream.h"
#include "../hls/dense_gemv.h"

int main() {
    hls::stream<ap_int<8>> in_strm("in_strm");
    hls::stream<ap_int<32>> out_strm("out_strm");
    
    int weights[N][N];
    int input_vec[N];
    int expected_out[N];
    int errors = 0;
    
    // 1. Initialize weights and input vector
    for(int i = 0; i < N; i++) {
        input_vec[i] = i % 10; // 0, 1, 2, 3...
        for(int j = 0; j < N; j++) {
            weights[i][j] = (i + j) % 5; // 0, 1, 2, 3, 4, 0...
        }
    }
    
    // 2. Feed the input stream
    for(int i = 0; i < N; i++) {
        in_strm.write(input_vec[i]);
    }
    
    // 3. Calculate expected output correctly (Standard Matrix-Vector Multiply)
    for(int i = 0; i < N; i++) {
        int sum = 0;
        for(int j = 0; j < N; j++) {
            sum += input_vec[j] * weights[i][j];
        }
        expected_out[i] = sum;
    }
    
    // 4. Run the hardware function
    dense_gemv(in_strm, weights, out_strm, N);
    
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
        std::cout << "--- ALL TESTS PASSED ---" << std::endl;
        return 0;
    } else {
        std::cout << "--- TESTS FAILED ---" << std::endl;
        return 1;
    }
}