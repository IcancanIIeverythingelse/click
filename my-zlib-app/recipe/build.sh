#!/bin/bash
set -e

# Colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Building my-zlib-app on Linux ===${NC}"

# Check required tools
echo -e "${BLUE}Checking required tools...${NC}"

if ! command -v cmake &> /dev/null; then
    echo "Error: CMake is not installed"
    echo "Install it with: sudo apt-get install cmake"
    exit 1
fi

if ! command -v g++ &> /dev/null; then
    echo "Error: g++ is not installed"
    echo "Install it with: sudo apt-get install build-essential"
    exit 1
fi

if ! command -v pkg-config &> /dev/null; then
    echo "Warning: pkg-config is not installed"
    echo "Install it with: sudo apt-get install pkg-config"
fi

# Create build directory
echo -e "${BLUE}Creating build directory...${NC}"
mkdir -p build
cd build

# Configure CMake
echo -e "${BLUE}Configuring CMake...${NC}"
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local

# Build the project
echo -e "${BLUE}Building the application...${NC}"
cmake --build . --parallel $(nproc)

echo -e "${GREEN}✓ Build finished successfully!${NC}"

# Optional installation
echo -e "${BLUE}Do you want to install the application? (y/n)${NC}"
read -r response
if [[ "$response" =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Installing...${NC}"
    sudo cmake --install .
    echo -e "${GREEN}✓ Installation finished!${NC}"
else
    echo -e "${BLUE}Skipping installation.${NC}"
    echo "The application is located at: build/my-zlib-app"
fi

cd ..