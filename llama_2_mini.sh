#!/bin/bash

#Set Defaults
num_tokens=512
temp=0.8
repeat_penalty=1.1
prompt="Tell me a funny joke!"
# see https://github.com/ggerganov/llama.cpp/blob/master/examples/main/README.md for docs

# Check if each input argument is set

while getopts ":n:t:r:p:" opt; do
    case $opt in
        n) num_tokens="$OPTARG";;
        t) temp="$OPTARG";;
        r) repeat_penalty="$OPTARG";;
        p) prompt="$OPTARG";;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
        :) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
    esac
done

output_file=output.txt

echo "Prompt:" >$output_file

echo "$prompt" >>$output_file

echo "Response:" >>$output_file

./main -t 2 -m ./models/llama-2-7b.ggmlv3.q4_K_S.bin --color -c 2048 -n $num_tokens --temp $temp --repeat_penalty $repeat_penalty -p "$prompt" >>$output_file

cat $output_file