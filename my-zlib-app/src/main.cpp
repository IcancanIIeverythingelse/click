#include "../include/compressor.h"
#include <iostream>
#include <string>

int main()
{
    std::string text =
        "Hello from Conda package!";

    std::size_t compressedSize =
        compressString(text);

    std::cout << "Original size: "
              << text.size()
              << '\n';

    std::cout << "Compressed size: "
              << compressedSize
              << '\n';

    return 0;
}