#include "mac_accumulator.h"


void mac_accumulator(hls::stream<ap_int<8>> &a_stream, 
                     hls::stream<ap_int<8>> &b_stream, 
                     int N, 
                     ap_int<32> &final_sum) {
        #pragma HLS INTERFACE axis port=a_stream
    #pragma HLS INTERFACE axis port=b_stream
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=final_sum
    #pragma HLS INTERFACE s_axilite port=return

    
    
    ap_int<32> sum = 0;

    for (int i = 0; i < N; i++) {
        
        #pragma HLS pipeline II=1
        ap_int<8> a_val = a_stream.read();
        ap_int<8> b_val = b_stream.read();        
        sum = sum + (a_val*b_val);
    }

    final_sum = sum;
}