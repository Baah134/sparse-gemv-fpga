#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_directio.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_in_stream_cap_bc;
static AESL_RUNTIME_BC __xlx_in_stream_V_size_Reader("../tv/stream_size/stream_size_in_in_stream.dat");
unsigned int ap_apatb_out_stream_cap_bc;
static AESL_RUNTIME_BC __xlx_out_stream_V_size_Reader("../tv/stream_size/stream_size_out_out_stream.dat");
using hls::sim::Byte;
extern "C" void dense_gemv(char*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, int*, int);
extern "C" void apatb_dense_gemv_hw(volatile void * __xlx_apatb_param_in_stream, volatile void * __xlx_apatb_param_weights_0, volatile void * __xlx_apatb_param_weights_1, volatile void * __xlx_apatb_param_weights_2, volatile void * __xlx_apatb_param_weights_3, volatile void * __xlx_apatb_param_weights_4, volatile void * __xlx_apatb_param_weights_5, volatile void * __xlx_apatb_param_weights_6, volatile void * __xlx_apatb_param_weights_7, volatile void * __xlx_apatb_param_weights_8, volatile void * __xlx_apatb_param_weights_9, volatile void * __xlx_apatb_param_weights_10, volatile void * __xlx_apatb_param_weights_11, volatile void * __xlx_apatb_param_weights_12, volatile void * __xlx_apatb_param_weights_13, volatile void * __xlx_apatb_param_weights_14, volatile void * __xlx_apatb_param_weights_15, volatile void * __xlx_apatb_param_weights_16, volatile void * __xlx_apatb_param_weights_17, volatile void * __xlx_apatb_param_weights_18, volatile void * __xlx_apatb_param_weights_19, volatile void * __xlx_apatb_param_weights_20, volatile void * __xlx_apatb_param_weights_21, volatile void * __xlx_apatb_param_weights_22, volatile void * __xlx_apatb_param_weights_23, volatile void * __xlx_apatb_param_weights_24, volatile void * __xlx_apatb_param_weights_25, volatile void * __xlx_apatb_param_weights_26, volatile void * __xlx_apatb_param_weights_27, volatile void * __xlx_apatb_param_weights_28, volatile void * __xlx_apatb_param_weights_29, volatile void * __xlx_apatb_param_weights_30, volatile void * __xlx_apatb_param_weights_31, volatile void * __xlx_apatb_param_out_stream, int __xlx_apatb_param_num_rows) {
using hls::sim::createStream;
auto* sin_stream = createStream((hls::stream<char>*)__xlx_apatb_param_in_stream);
  // Collect __xlx_weights_0__tmp_vec
std::vector<Byte<4>> __xlx_weights_0__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_0)[i]);
}
  int __xlx_size_param_weights_0 = 32;
  int __xlx_offset_param_weights_0 = 0;
  int __xlx_offset_byte_param_weights_0 = 0*4;
  // Collect __xlx_weights_1__tmp_vec
std::vector<Byte<4>> __xlx_weights_1__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_1)[i]);
}
  int __xlx_size_param_weights_1 = 32;
  int __xlx_offset_param_weights_1 = 0;
  int __xlx_offset_byte_param_weights_1 = 0*4;
  // Collect __xlx_weights_2__tmp_vec
std::vector<Byte<4>> __xlx_weights_2__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_2)[i]);
}
  int __xlx_size_param_weights_2 = 32;
  int __xlx_offset_param_weights_2 = 0;
  int __xlx_offset_byte_param_weights_2 = 0*4;
  // Collect __xlx_weights_3__tmp_vec
std::vector<Byte<4>> __xlx_weights_3__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_3)[i]);
}
  int __xlx_size_param_weights_3 = 32;
  int __xlx_offset_param_weights_3 = 0;
  int __xlx_offset_byte_param_weights_3 = 0*4;
  // Collect __xlx_weights_4__tmp_vec
std::vector<Byte<4>> __xlx_weights_4__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_4)[i]);
}
  int __xlx_size_param_weights_4 = 32;
  int __xlx_offset_param_weights_4 = 0;
  int __xlx_offset_byte_param_weights_4 = 0*4;
  // Collect __xlx_weights_5__tmp_vec
std::vector<Byte<4>> __xlx_weights_5__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_5)[i]);
}
  int __xlx_size_param_weights_5 = 32;
  int __xlx_offset_param_weights_5 = 0;
  int __xlx_offset_byte_param_weights_5 = 0*4;
  // Collect __xlx_weights_6__tmp_vec
std::vector<Byte<4>> __xlx_weights_6__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_6)[i]);
}
  int __xlx_size_param_weights_6 = 32;
  int __xlx_offset_param_weights_6 = 0;
  int __xlx_offset_byte_param_weights_6 = 0*4;
  // Collect __xlx_weights_7__tmp_vec
std::vector<Byte<4>> __xlx_weights_7__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_7)[i]);
}
  int __xlx_size_param_weights_7 = 32;
  int __xlx_offset_param_weights_7 = 0;
  int __xlx_offset_byte_param_weights_7 = 0*4;
  // Collect __xlx_weights_8__tmp_vec
std::vector<Byte<4>> __xlx_weights_8__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_8__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_8)[i]);
}
  int __xlx_size_param_weights_8 = 32;
  int __xlx_offset_param_weights_8 = 0;
  int __xlx_offset_byte_param_weights_8 = 0*4;
  // Collect __xlx_weights_9__tmp_vec
std::vector<Byte<4>> __xlx_weights_9__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_9__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_9)[i]);
}
  int __xlx_size_param_weights_9 = 32;
  int __xlx_offset_param_weights_9 = 0;
  int __xlx_offset_byte_param_weights_9 = 0*4;
  // Collect __xlx_weights_10__tmp_vec
std::vector<Byte<4>> __xlx_weights_10__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_10__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_10)[i]);
}
  int __xlx_size_param_weights_10 = 32;
  int __xlx_offset_param_weights_10 = 0;
  int __xlx_offset_byte_param_weights_10 = 0*4;
  // Collect __xlx_weights_11__tmp_vec
std::vector<Byte<4>> __xlx_weights_11__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_11__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_11)[i]);
}
  int __xlx_size_param_weights_11 = 32;
  int __xlx_offset_param_weights_11 = 0;
  int __xlx_offset_byte_param_weights_11 = 0*4;
  // Collect __xlx_weights_12__tmp_vec
std::vector<Byte<4>> __xlx_weights_12__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_12__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_12)[i]);
}
  int __xlx_size_param_weights_12 = 32;
  int __xlx_offset_param_weights_12 = 0;
  int __xlx_offset_byte_param_weights_12 = 0*4;
  // Collect __xlx_weights_13__tmp_vec
std::vector<Byte<4>> __xlx_weights_13__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_13__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_13)[i]);
}
  int __xlx_size_param_weights_13 = 32;
  int __xlx_offset_param_weights_13 = 0;
  int __xlx_offset_byte_param_weights_13 = 0*4;
  // Collect __xlx_weights_14__tmp_vec
std::vector<Byte<4>> __xlx_weights_14__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_14__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_14)[i]);
}
  int __xlx_size_param_weights_14 = 32;
  int __xlx_offset_param_weights_14 = 0;
  int __xlx_offset_byte_param_weights_14 = 0*4;
  // Collect __xlx_weights_15__tmp_vec
std::vector<Byte<4>> __xlx_weights_15__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_15__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_15)[i]);
}
  int __xlx_size_param_weights_15 = 32;
  int __xlx_offset_param_weights_15 = 0;
  int __xlx_offset_byte_param_weights_15 = 0*4;
  // Collect __xlx_weights_16__tmp_vec
std::vector<Byte<4>> __xlx_weights_16__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_16__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_16)[i]);
}
  int __xlx_size_param_weights_16 = 32;
  int __xlx_offset_param_weights_16 = 0;
  int __xlx_offset_byte_param_weights_16 = 0*4;
  // Collect __xlx_weights_17__tmp_vec
std::vector<Byte<4>> __xlx_weights_17__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_17__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_17)[i]);
}
  int __xlx_size_param_weights_17 = 32;
  int __xlx_offset_param_weights_17 = 0;
  int __xlx_offset_byte_param_weights_17 = 0*4;
  // Collect __xlx_weights_18__tmp_vec
std::vector<Byte<4>> __xlx_weights_18__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_18__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_18)[i]);
}
  int __xlx_size_param_weights_18 = 32;
  int __xlx_offset_param_weights_18 = 0;
  int __xlx_offset_byte_param_weights_18 = 0*4;
  // Collect __xlx_weights_19__tmp_vec
std::vector<Byte<4>> __xlx_weights_19__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_19__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_19)[i]);
}
  int __xlx_size_param_weights_19 = 32;
  int __xlx_offset_param_weights_19 = 0;
  int __xlx_offset_byte_param_weights_19 = 0*4;
  // Collect __xlx_weights_20__tmp_vec
std::vector<Byte<4>> __xlx_weights_20__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_20__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_20)[i]);
}
  int __xlx_size_param_weights_20 = 32;
  int __xlx_offset_param_weights_20 = 0;
  int __xlx_offset_byte_param_weights_20 = 0*4;
  // Collect __xlx_weights_21__tmp_vec
std::vector<Byte<4>> __xlx_weights_21__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_21__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_21)[i]);
}
  int __xlx_size_param_weights_21 = 32;
  int __xlx_offset_param_weights_21 = 0;
  int __xlx_offset_byte_param_weights_21 = 0*4;
  // Collect __xlx_weights_22__tmp_vec
std::vector<Byte<4>> __xlx_weights_22__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_22__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_22)[i]);
}
  int __xlx_size_param_weights_22 = 32;
  int __xlx_offset_param_weights_22 = 0;
  int __xlx_offset_byte_param_weights_22 = 0*4;
  // Collect __xlx_weights_23__tmp_vec
std::vector<Byte<4>> __xlx_weights_23__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_23__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_23)[i]);
}
  int __xlx_size_param_weights_23 = 32;
  int __xlx_offset_param_weights_23 = 0;
  int __xlx_offset_byte_param_weights_23 = 0*4;
  // Collect __xlx_weights_24__tmp_vec
std::vector<Byte<4>> __xlx_weights_24__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_24__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_24)[i]);
}
  int __xlx_size_param_weights_24 = 32;
  int __xlx_offset_param_weights_24 = 0;
  int __xlx_offset_byte_param_weights_24 = 0*4;
  // Collect __xlx_weights_25__tmp_vec
std::vector<Byte<4>> __xlx_weights_25__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_25__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_25)[i]);
}
  int __xlx_size_param_weights_25 = 32;
  int __xlx_offset_param_weights_25 = 0;
  int __xlx_offset_byte_param_weights_25 = 0*4;
  // Collect __xlx_weights_26__tmp_vec
std::vector<Byte<4>> __xlx_weights_26__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_26__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_26)[i]);
}
  int __xlx_size_param_weights_26 = 32;
  int __xlx_offset_param_weights_26 = 0;
  int __xlx_offset_byte_param_weights_26 = 0*4;
  // Collect __xlx_weights_27__tmp_vec
std::vector<Byte<4>> __xlx_weights_27__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_27__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_27)[i]);
}
  int __xlx_size_param_weights_27 = 32;
  int __xlx_offset_param_weights_27 = 0;
  int __xlx_offset_byte_param_weights_27 = 0*4;
  // Collect __xlx_weights_28__tmp_vec
std::vector<Byte<4>> __xlx_weights_28__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_28__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_28)[i]);
}
  int __xlx_size_param_weights_28 = 32;
  int __xlx_offset_param_weights_28 = 0;
  int __xlx_offset_byte_param_weights_28 = 0*4;
  // Collect __xlx_weights_29__tmp_vec
std::vector<Byte<4>> __xlx_weights_29__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_29__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_29)[i]);
}
  int __xlx_size_param_weights_29 = 32;
  int __xlx_offset_param_weights_29 = 0;
  int __xlx_offset_byte_param_weights_29 = 0*4;
  // Collect __xlx_weights_30__tmp_vec
std::vector<Byte<4>> __xlx_weights_30__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_30__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_30)[i]);
}
  int __xlx_size_param_weights_30 = 32;
  int __xlx_offset_param_weights_30 = 0;
  int __xlx_offset_byte_param_weights_30 = 0*4;
  // Collect __xlx_weights_31__tmp_vec
std::vector<Byte<4>> __xlx_weights_31__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_weights_31__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_weights_31)[i]);
}
  int __xlx_size_param_weights_31 = 32;
  int __xlx_offset_param_weights_31 = 0;
  int __xlx_offset_byte_param_weights_31 = 0*4;
  //Create input buffer for out_stream
  ap_apatb_out_stream_cap_bc = __xlx_out_stream_V_size_Reader.read_size();
  int* __xlx_out_stream_input_buffer= new int[ap_apatb_out_stream_cap_bc];
auto* sout_stream = createStream((hls::stream<int>*)__xlx_apatb_param_out_stream);
  // DUT call
  dense_gemv(sin_stream->data<char>(), __xlx_weights_0__tmp_vec.data(), __xlx_weights_1__tmp_vec.data(), __xlx_weights_2__tmp_vec.data(), __xlx_weights_3__tmp_vec.data(), __xlx_weights_4__tmp_vec.data(), __xlx_weights_5__tmp_vec.data(), __xlx_weights_6__tmp_vec.data(), __xlx_weights_7__tmp_vec.data(), __xlx_weights_8__tmp_vec.data(), __xlx_weights_9__tmp_vec.data(), __xlx_weights_10__tmp_vec.data(), __xlx_weights_11__tmp_vec.data(), __xlx_weights_12__tmp_vec.data(), __xlx_weights_13__tmp_vec.data(), __xlx_weights_14__tmp_vec.data(), __xlx_weights_15__tmp_vec.data(), __xlx_weights_16__tmp_vec.data(), __xlx_weights_17__tmp_vec.data(), __xlx_weights_18__tmp_vec.data(), __xlx_weights_19__tmp_vec.data(), __xlx_weights_20__tmp_vec.data(), __xlx_weights_21__tmp_vec.data(), __xlx_weights_22__tmp_vec.data(), __xlx_weights_23__tmp_vec.data(), __xlx_weights_24__tmp_vec.data(), __xlx_weights_25__tmp_vec.data(), __xlx_weights_26__tmp_vec.data(), __xlx_weights_27__tmp_vec.data(), __xlx_weights_28__tmp_vec.data(), __xlx_weights_29__tmp_vec.data(), __xlx_weights_30__tmp_vec.data(), __xlx_weights_31__tmp_vec.data(), sout_stream->data<int>(), __xlx_apatb_param_num_rows);
sin_stream->transfer((hls::stream<char>*)__xlx_apatb_param_in_stream);
// print __xlx_apatb_param_weights_0
for (size_t i = 0; i < __xlx_size_param_weights_0; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_0)[i] = __xlx_weights_0__tmp_vec[__xlx_offset_param_weights_0+i];
}
// print __xlx_apatb_param_weights_1
for (size_t i = 0; i < __xlx_size_param_weights_1; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_1)[i] = __xlx_weights_1__tmp_vec[__xlx_offset_param_weights_1+i];
}
// print __xlx_apatb_param_weights_2
for (size_t i = 0; i < __xlx_size_param_weights_2; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_2)[i] = __xlx_weights_2__tmp_vec[__xlx_offset_param_weights_2+i];
}
// print __xlx_apatb_param_weights_3
for (size_t i = 0; i < __xlx_size_param_weights_3; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_3)[i] = __xlx_weights_3__tmp_vec[__xlx_offset_param_weights_3+i];
}
// print __xlx_apatb_param_weights_4
for (size_t i = 0; i < __xlx_size_param_weights_4; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_4)[i] = __xlx_weights_4__tmp_vec[__xlx_offset_param_weights_4+i];
}
// print __xlx_apatb_param_weights_5
for (size_t i = 0; i < __xlx_size_param_weights_5; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_5)[i] = __xlx_weights_5__tmp_vec[__xlx_offset_param_weights_5+i];
}
// print __xlx_apatb_param_weights_6
for (size_t i = 0; i < __xlx_size_param_weights_6; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_6)[i] = __xlx_weights_6__tmp_vec[__xlx_offset_param_weights_6+i];
}
// print __xlx_apatb_param_weights_7
for (size_t i = 0; i < __xlx_size_param_weights_7; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_7)[i] = __xlx_weights_7__tmp_vec[__xlx_offset_param_weights_7+i];
}
// print __xlx_apatb_param_weights_8
for (size_t i = 0; i < __xlx_size_param_weights_8; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_8)[i] = __xlx_weights_8__tmp_vec[__xlx_offset_param_weights_8+i];
}
// print __xlx_apatb_param_weights_9
for (size_t i = 0; i < __xlx_size_param_weights_9; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_9)[i] = __xlx_weights_9__tmp_vec[__xlx_offset_param_weights_9+i];
}
// print __xlx_apatb_param_weights_10
for (size_t i = 0; i < __xlx_size_param_weights_10; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_10)[i] = __xlx_weights_10__tmp_vec[__xlx_offset_param_weights_10+i];
}
// print __xlx_apatb_param_weights_11
for (size_t i = 0; i < __xlx_size_param_weights_11; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_11)[i] = __xlx_weights_11__tmp_vec[__xlx_offset_param_weights_11+i];
}
// print __xlx_apatb_param_weights_12
for (size_t i = 0; i < __xlx_size_param_weights_12; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_12)[i] = __xlx_weights_12__tmp_vec[__xlx_offset_param_weights_12+i];
}
// print __xlx_apatb_param_weights_13
for (size_t i = 0; i < __xlx_size_param_weights_13; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_13)[i] = __xlx_weights_13__tmp_vec[__xlx_offset_param_weights_13+i];
}
// print __xlx_apatb_param_weights_14
for (size_t i = 0; i < __xlx_size_param_weights_14; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_14)[i] = __xlx_weights_14__tmp_vec[__xlx_offset_param_weights_14+i];
}
// print __xlx_apatb_param_weights_15
for (size_t i = 0; i < __xlx_size_param_weights_15; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_15)[i] = __xlx_weights_15__tmp_vec[__xlx_offset_param_weights_15+i];
}
// print __xlx_apatb_param_weights_16
for (size_t i = 0; i < __xlx_size_param_weights_16; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_16)[i] = __xlx_weights_16__tmp_vec[__xlx_offset_param_weights_16+i];
}
// print __xlx_apatb_param_weights_17
for (size_t i = 0; i < __xlx_size_param_weights_17; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_17)[i] = __xlx_weights_17__tmp_vec[__xlx_offset_param_weights_17+i];
}
// print __xlx_apatb_param_weights_18
for (size_t i = 0; i < __xlx_size_param_weights_18; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_18)[i] = __xlx_weights_18__tmp_vec[__xlx_offset_param_weights_18+i];
}
// print __xlx_apatb_param_weights_19
for (size_t i = 0; i < __xlx_size_param_weights_19; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_19)[i] = __xlx_weights_19__tmp_vec[__xlx_offset_param_weights_19+i];
}
// print __xlx_apatb_param_weights_20
for (size_t i = 0; i < __xlx_size_param_weights_20; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_20)[i] = __xlx_weights_20__tmp_vec[__xlx_offset_param_weights_20+i];
}
// print __xlx_apatb_param_weights_21
for (size_t i = 0; i < __xlx_size_param_weights_21; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_21)[i] = __xlx_weights_21__tmp_vec[__xlx_offset_param_weights_21+i];
}
// print __xlx_apatb_param_weights_22
for (size_t i = 0; i < __xlx_size_param_weights_22; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_22)[i] = __xlx_weights_22__tmp_vec[__xlx_offset_param_weights_22+i];
}
// print __xlx_apatb_param_weights_23
for (size_t i = 0; i < __xlx_size_param_weights_23; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_23)[i] = __xlx_weights_23__tmp_vec[__xlx_offset_param_weights_23+i];
}
// print __xlx_apatb_param_weights_24
for (size_t i = 0; i < __xlx_size_param_weights_24; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_24)[i] = __xlx_weights_24__tmp_vec[__xlx_offset_param_weights_24+i];
}
// print __xlx_apatb_param_weights_25
for (size_t i = 0; i < __xlx_size_param_weights_25; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_25)[i] = __xlx_weights_25__tmp_vec[__xlx_offset_param_weights_25+i];
}
// print __xlx_apatb_param_weights_26
for (size_t i = 0; i < __xlx_size_param_weights_26; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_26)[i] = __xlx_weights_26__tmp_vec[__xlx_offset_param_weights_26+i];
}
// print __xlx_apatb_param_weights_27
for (size_t i = 0; i < __xlx_size_param_weights_27; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_27)[i] = __xlx_weights_27__tmp_vec[__xlx_offset_param_weights_27+i];
}
// print __xlx_apatb_param_weights_28
for (size_t i = 0; i < __xlx_size_param_weights_28; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_28)[i] = __xlx_weights_28__tmp_vec[__xlx_offset_param_weights_28+i];
}
// print __xlx_apatb_param_weights_29
for (size_t i = 0; i < __xlx_size_param_weights_29; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_29)[i] = __xlx_weights_29__tmp_vec[__xlx_offset_param_weights_29+i];
}
// print __xlx_apatb_param_weights_30
for (size_t i = 0; i < __xlx_size_param_weights_30; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_30)[i] = __xlx_weights_30__tmp_vec[__xlx_offset_param_weights_30+i];
}
// print __xlx_apatb_param_weights_31
for (size_t i = 0; i < __xlx_size_param_weights_31; ++i) {
((Byte<4>*)__xlx_apatb_param_weights_31)[i] = __xlx_weights_31__tmp_vec[__xlx_offset_param_weights_31+i];
}
sout_stream->transfer((hls::stream<int>*)__xlx_apatb_param_out_stream);
}
