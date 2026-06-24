#include "../include/compressor.h"
#include "../extern/zlib/zlib.h"

std::vector<uint8_t> compressString(const std::string& input)
{
    uLong srcLen = input.size();
    uLong destLen = compressBound(srcLen);

    std::vector<uint8_t> compressed(destLen);

    compress(
        compressed.data(),
        &destLen,
        reinterpret_cast<const Bytef*>(input.c_str()),
        srcLen);

    compressed.resize(destLen);

    return compressed;
}