#include "mac_accumulator.h"


void mac_accumulator(hls::stream<ap_int<8>> &a_stream, 
                     hls::stream<ap_int<8>> &b_stream, 
                     int N, 
                     ap_int<32> &final_sum) {
    
    // Pragmas (Just copy these, they tell the tool how to wire the pins)
    #pragma HLS INTERFACE axis port=a_stream
    #pragma HLS INTERFACE axis port=b_stream
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=final_sum
    #pragma HLS INTERFACE s_axilite port=return

    // 1. Create a 32-bit accumulator variable and set it to 0.
    // Use the type: ap_int<32>
    
    ap_int<32> sum = 0;

    // 2. Write a standard C for-loop that runs 'N' times.
    for (int i = 0; i < N; i++) {
        
        // This pragma must be the first thing in the loop.
        #pragma HLS pipeline II=1
        
        // 3. Read one value from a_stream and one from b_stream.
        // Store them in temporary variables (e.g., ap_int<8> a_val = a_stream.read();)
        
        ap_int<8> a_val = a_stream.read();
        ap_int<8> b_val = b_stream.read();

        
        // 4. Multiply them together and add the result to your accumulator.
        
        sum = sum + (a_val*b_val);
    }

    // 5. After the loop finishes, assign your accumulator to final_sum.

    final_sum = sum;
}