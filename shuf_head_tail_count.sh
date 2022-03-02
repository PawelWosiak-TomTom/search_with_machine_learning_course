#!/bin/bash
echo "Shuffling.."
shuf /workspace/datasets/fasttext/output.fasttext > /workspace/datasets/fasttext/shuffled.fasttext

echo "head -n 10000 > train.."
head -n 10000 /workspace/datasets/fasttext/shuffled.fasttext > /workspace/datasets/fasttext/train.fasttext

echo "tail -n10000 > test.."
tail -n 10000 /workspace/datasets/fasttext/shuffled.fasttext > /workspace/datasets/fasttext/test.fasttext

echo "categories count of train (head):"
cat /workspace/datasets/fasttext/train.fasttext | cut -d ' ' -f1 | sort | uniq -c | sort -n | head

echo "categories count of test (head):"
cat /workspace/datasets/fasttext/test.fasttext | cut -d ' ' -f1 | sort | uniq -c | sort -n | head
