#!/bin/bash
shuf /workspace/datasets/labeled_query_data.txt > /workspace/datasets/shuffled.txt
head -n 50000 /workspace/datasets/shuffled.txt > /workspace/datasets/train.txt
tail -n 50000 /workspace/datasets/shuffled.txt > /workspace/datasets/test.txt

echo "Queries in files:"
echo -n "  labeled: "; wc -l < /workspace/datasets/labeled_query_data.txt
echo -n "  shuffled: "; wc -l < /workspace/datasets/shuffled.txt
echo -n "  train: "; wc -l < /workspace/datasets/train.txt
echo -n "  test: "; wc -l < /workspace/datasets/test.txt
 
echo "Categories in files:"
echo -n "  train: "; cat /workspace/datasets/train.txt | cut -d ' ' -f1 | sort | uniq | wc -l
echo -n "  test: "; cat /workspace/datasets/test.txt | cut -d ' ' -f1 | sort | uniq | wc -l

~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt