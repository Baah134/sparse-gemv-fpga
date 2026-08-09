#include "ap_int.h"
#include "hls_stream.h"

#define N 32

void sparse_gemv(hls::stream<ap_int<8>> &in_stream, 
                 hls::stream<ap_uint<1>> &bitmask_stream,  // NEW: 1-bit stream
                 int weights[N][N], 
                 hls::stream<ap_int<32>> &out_stream, 
                 int num_rows) {
    
    // Interface Pragmas
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=bitmask_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE s_axilite port=weights
    #pragma HLS INTERFACE s_axilite port=num_rows
    #pragma HLS INTERFACE s_axilite port=return

    #pragma HLS ARRAY_PARTITION variable=weights complete dim=2


    ap_int<8> input_buffer[N];
    ap_uint<1> mask_buffer[N]; 
    
    #pragma HLS ARRAY_PARTITION variable=input_buffer complete dim=1
    #pragma HLS ARRAY_PARTITION variable=mask_buffer complete dim=1

    
    for (int i = 0; i < N; i++) {
        input_buffer[i] = in_stream.read();
        mask_buffer[i] = bitmask_stream.read();
    }

    
    for (int i = 0; i < num_rows; i++) {
        
        // 'Off' so the tool allows dynamic skipping II (skipping zeros)
        #pragma HLS pipeline II=1 
        
        ap_int<32> acc = 0;

        for (int j = 0; j < N; j++) {
            if (mask_buffer[j] ==1){
                acc = acc + input_buffer[j]*weights[i][j]; 
            }

        }

        out_stream.write(acc);
    }
}