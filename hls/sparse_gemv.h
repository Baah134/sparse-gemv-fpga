#ifndef SPARSE_GEMV_H_
#define SPARSE_GEMV_H_

#include "ap_int.h"
#include "hls_stream.h"

#define N 32

void sparse_gemv(hls::stream<ap_int<8>> &in_stream, 
                 hls::stream<ap_uint<1>> &bitmask_stream, 
                 int weights[N][N], 
                 hls::stream<ap_int<32>> &out_stream, 
                 int num_rows);

#endif