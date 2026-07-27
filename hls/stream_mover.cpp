#include "stream_mover.h"


void stream_mover(hls::stream<ap_int<8>> &in_stream, 
                  hls::stream<ap_int<8>> &out_stream, 
                  int N) {
    
    // Interface Pragmas
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE s_axilite port=N
    #pragma HLS INTERFACE s_axilite port=return

    for (int i = 0; i < N; i++) {
        
        #pragma HLS pipeline II=1

        ap_int<8> val = in_stream.read();

        out_stream.write(val);

    }
}