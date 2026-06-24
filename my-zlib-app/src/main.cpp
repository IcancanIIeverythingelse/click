#include "../include/compressor.h"
#include <iostream>
#include <string>

int main()
{
    std::string text =
        "Hello from Conda package!";

    auto compressed =
        compressString(text);

    std::cout << "Original size: "
              << text.size()
              << '\n';

    std::cout << "Compressed size: "
              << compressed.size()
              << '\n';

    return 0;
}