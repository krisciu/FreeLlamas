#!/bin/bash


./main -t 2  -m ./models/llama-2-7b.ggmlv3.q4_0.bin --color -c 2048 --temp 0.7 --repeat_penalty 1.1 -n -1 -p "### Instruction: write me a story about how to run llama-2 on a docker container\n### Response:"


