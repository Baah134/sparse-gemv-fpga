#ifndef DENSE_GEMV_H_
#define DENSE_GEMV_H_

#include "ap_int.h"
#include "hls_stream.h"

#define N 32

void dense_gemv(hls::stream<ap_int<8>> &in_stream, 
                int weights[N][N], 
                hls::stream<ap_int<32>> &out_stream, 
                int num_rows);

#endif