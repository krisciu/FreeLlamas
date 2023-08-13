#!/bin/bash


./main -t 2  -m ./models/llama-2-7b.ggmlv3.q4_K_S.bin --color -c 2048 -n $NUM_TOKENS --temp $TEMP --repeat_penalty $REPEAT_PENALTY  -p $PROMPT

