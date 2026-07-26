#include <iostream>
#include "mac_accumulator.h"

// Include your MAC function so the testbench knows what it is

int main() {
    // 1. Create the empty streams and the output variable
    hls::stream<ap_int<8>> a_strm("a_strm");
    hls::stream<ap_int<8>> b_strm("b_strm");
    ap_int<32> result;
    
    int N = 32; // We will process 32 pairs of numbers
    int expected_sum = 0;
    
    // 2. Feed the streams with data (like loading a conveyor belt)
    for(int i = 0; i < N; i++) {
        ap_int<8> a_val = i % 10;       // 0,1,2,3,4,5,6,7,8,9,0...
        ap_int<8> b_val = (i + 2) % 10; // 2,3,4,5,6,7,8,9,0,1...
        a_strm.write(a_val);
        b_strm.write(b_val);
        
        // Calculate what the answer should be in standard C
        expected_sum += a_val * b_val;
    }
    
    // 3. Run your hardware function!
    mac_accumulator(a_strm, b_strm, N, result);
    
    // 4. Check if the hardware matches the software
    std::cout << "Expected: " << expected_sum << std::endl;
    std::cout << "Got:      " << result << std::endl;
    
    if(result == expected_sum) {
        std::cout << "--- TEST PASSED ---" << std::endl;
        return 0;
    } else {
        std::cout << "--- TEST FAILED ---" << std::endl;
        return 1;
    }
}