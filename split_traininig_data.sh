#!/bin/bash
shuf /workspace/datasets/labeled_query_data.txt > /workspace/datasets/shuffled.txt
#cat /workspace/datasets/shuffled.txt | cut -d ' ' -f1 | sort | uniq > /workspace/datasets/shuffled.categories
rm /workspace/datasets/train.txt
rm /workspace/datasets/test_balanced.txt
for category in `cat /workspace/datasets/shuffled.categories`
do
    cat /workspace/datasets/shuffled.txt | grep $category | head -n 168 >> /workspace/datasets/train.txt
    cat /workspace/datasets/shuffled.txt | grep $category | tail -n 168 >> /workspace/datasets/test_balanced.txt
done

tail -n 50000 /workspace/datasets/shuffled.txt > /workspace/datasets/test_unbalanced.txt

echo "Queries in files:"
echo -n "  labeled: "; wc -l < /workspace/datasets/labeled_query_data.txt
echo -n "  shuffled: "; wc -l < /workspace/datasets/shuffled.txt
echo -n "  train: "; wc -l < /workspace/datasets/train.txt
echo -n "  test_balanced: "; wc -l < /workspace/datasets/test_balanced.txt
echo -n "  test_unbalanced: "; wc -l < /workspace/datasets/test_unbalanced.txt

echo "Total categories in files:"
echo -n "  train: "; cat /workspace/datasets/train.txt | cut -d ' ' -f1 | sort | uniq | wc -l
echo -n "  test_balanced: "; cat /workspace/datasets/test_balanced.txt | cut -d ' ' -f1 | sort | uniq | wc -l
echo -n "  test_unbalanced: "; cat /workspace/datasets/test_unbalanced.txt | cut -d ' ' -f1 | sort | uniq | wc -l

echo "Least frequent categories in train:"
cat /workspace/datasets/train.txt | cut -d ' ' -f1 | sort | uniq -c | sort -n | head

~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model
echo "Testing on test_balanced: "; ~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test_balanced.txt
echo "Testing on test_unbalanced: "; ~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test_unbalanced.txt