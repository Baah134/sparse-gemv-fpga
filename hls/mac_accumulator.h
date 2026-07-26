#ifndef MAC_ACCUMULATOR_H_
#define MAC_ACCUMULATOR_H_

#include "ap_int.h"
#include "hls_stream.h"

// Just the function declaration (no logic here)
void mac_accumulator(hls::stream<ap_int<8>> &a_stream, 
                     hls::stream<ap_int<8>> &b_stream, 
                     int N, 
                     ap_int<32> &final_sum);

#endif