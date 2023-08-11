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
RUN wget https://huggingface.co/TheBloke/Llama-2-7B-GGML/blob/main/llama-2-7b.ggmlv3.q4_K_S.bin

WORKDIR /app/llama.cpp

COPY llama_2_mini.sh /app/llama.cpp/examples/llama_2_mini.sh

# Specify the command to run when the container starts
CMD ["./examples/llama_2_mini.sh"]