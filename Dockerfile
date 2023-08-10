FROM ubuntu:latest

# Install Git to clone the repository
RUN apt-get update && apt-get install -y git wget make g++ 

# Set the working directory inside the container
WORKDIR /app

# Clone the llama.cpp repository
RUN git clone https://github.com/ggerganov/llama.cpp

# Change WORKDIR to the cloned repository directory
WORKDIR /app/llama.cpp

# Build the project 
RUN make

WORKDIR /app/llama.cpp/models

# Download proper model
RUN wget https://huggingface.co/Sosaka/Alpaca-native-4bit-ggml/resolve/main/ggml-alpaca-7b-q4.bin 

WORKDIR /app/llama.cpp

COPY alpaca_mini.sh /app/llama.cpp/examples/alpaca_mini.sh

# Specify the command to run when the container starts
CMD ["./examples/alpaca_mini.sh"]