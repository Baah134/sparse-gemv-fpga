#include <iostream>
#include "../hls/stream_mover.h"

int main() {
    hls::stream<ap_int<8>> in_strm("in_strm");
    hls::stream<ap_int<8>> out_strm("out_strm");
    
    int N = 16; // Let's move 16 items
    int errors = 0;
    
    // 1. Fill the input stream with data
    for(int i = 0; i < N; i++) {
        in_strm.write(i * 2); // 0, 2, 4, 6, 8...
    }
    
    // 2. Run the hardware function
    stream_mover(in_strm, out_strm, N);
    
    // 3. Read the output stream and check it
    for(int i = 0; i < N; i++) {
        ap_int<8> expected = i * 2;
        ap_int<8> result = out_strm.read();
        
        std::cout << "Expected: " << expected << " | Got: " << result;
        if(result == expected) {
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