#ifndef STREAM_MOVER_H_
#define STREAM_MOVER_H_

#include "ap_int.h"
#include "hls_stream.h"

// Just the function declaration
void stream_mover(hls::stream<ap_int<8>> &in_stream, 
                  hls::stream<ap_int<8>> &out_stream, 
                  int N);

#endif