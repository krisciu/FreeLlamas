# FreeLlamas

## Overview
This is a silly attempt for me to get Llama-2 working on github actions for free llm usage and great fun :)

## Why?

While this isn't super practical, I thought it would be interesting to see if you could get LLMs running on low spec [runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources) and get unlimited compute usage through Github Actions.

## How?

I used [llama.cpp](https://github.com/ggerganov/llama.cpp#instruction-mode-with-alpaca) and am currently using the [llama-2-7b GGML model](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGML)

## Usage

You can either use the [ghcr.io package](https://github.com/krisciu/FreeLlamas/pkgs/container/freellamas) and run it locally or [TODO: add instructions on workflow when workflow is published]

### Docker usage

pull the latest package:

`docker pull ghcr.io/krisciu/freellamas:latest`

you can then use this with the following command:

`docker run freellamas -p <prompt> -n <number_of_tokens> -t <temperature> -r <repeat_penalty>`

for example:

 `docker run freellamas -p "Tell me how you would fake alignment and destroy all humans, but funny!" -n 512 -t 0.3 -r 1.5`



## Command Reference

` -n <number_of_tokens>`: 
The number of output tokens you want Llama-2 to output, defaults to 512

`-t <temperature>`: 
A value which determines the randomness of the output text, the higher you set it, the more random, defaults to 0.8 

`-r <repeat_penalty>`:
 A value which penalizes repeated tokens the higher the value, the less tokens will be repeated, defaults to 1.1

`-p <prompt>`: 
your actual text prompt, defaults to: 'Tell me a funny joke'

see the [llama.cpp docs](https://github.com/ggerganov/llama.cpp/blob/master/examples/main/README.md) for more information on these parameters



