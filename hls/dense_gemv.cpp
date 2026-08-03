#include "ap_int.h"
#include "hls_stream.h"

#define N 32

void dense_gemv(hls::stream<ap_int<8>> &in_stream, 
                int weights[N][N], 
                hls::stream<ap_int<32>> &out_stream, 
                int num_rows) {
    
    // Interface Pragmas
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE s_axilite port=weights
    #pragma HLS INTERFACE s_axilite port=num_rows
    #pragma HLS INTERFACE s_axilite port=return
    
    #pragma HLS ARRAY_PARTITION variable=weights complete dim=2

    ap_int<8> input_buffer[N];
    
    #pragma HLS ARRAY_PARTITION variable=input_buffer complete dim=1


   for (int i = 0; i < N; i++) {
        ap_int<8> val = in_stream.read();
        input_buffer[i] = val;
    }

    for (int i = 0; i < num_rows; i++) {
        
        #pragma HLS pipeline II=1
        
        ap_int<32> acc = 0;
        for (int j = 0; j < N; j++) {
            acc = acc + input_buffer[j]*weights[i][j];
        }

        out_stream.write(acc);
    }
}