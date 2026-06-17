#include "../include/compressor.h"
#include "../extern/zlib/zlib.h"

std::size_t compressString(const std::string& input)
{
    uLong srcLen = input.size();
    uLong destLen = compressBound(srcLen);

    Bytef* compressed = new Bytef[destLen];

    compress(
        compressed,
        &destLen,
        reinterpret_cast<const Bytef*>(input.c_str()),
        srcLen);

    delete[] compressed;

    return destLen;
}