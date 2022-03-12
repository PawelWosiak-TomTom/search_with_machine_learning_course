#!/bin/bash
shuf /workspace/fasttext/labeled_query_data.txt > /workspace/fasttext/shuffled.txt

#cat /workspace/fasttext/shuffled.txt | cut -d ' ' -f1 | sort | uniq > /workspace/fasttext/shuffled.categories
# rm /workspace/fasttext/train.txt
# rm /workspace/fasttext/test_balanced.txt
# for category in `cat /workspace/fasttext/shuffled.categories`
# do
#     cat /workspace/fasttext/shuffled.txt | grep $category | head -n 168 >> /workspace/fasttext/train.txt
#     cat /workspace/fasttext/shuffled.txt | grep $category | tail -n 168 >> /workspace/fasttext/test_balanced.txt
# done

head -n 50000 /workspace/fasttext/shuffled.txt > /workspace/fasttext/train.txt
tail -n 50000 /workspace/fasttext/shuffled.txt > /workspace/fasttext/test.txt

echo "Queries in files:"
echo -n "  labeled: "; wc -l < /workspace/fasttext/labeled_query_data.txt
echo -n "  shuffled: "; wc -l < /workspace/fasttext/shuffled.txt
echo -n "  train: "; wc -l < /workspace/fasttext/train.txt
#echo -n "  test_balanced: "; wc -l < /workspace/fasttext/test_balanced.txt
echo -n "  test: "; wc -l < /workspace/fasttext/test.txt

echo "Total categories in files:"
echo -n "  train: "; cat /workspace/fasttext/train.txt | cut -d ' ' -f1 | sort | uniq | wc -l
#echo -n "  test_balanced: "; cat /workspace/fasttext/test_balanced.txt | cut -d ' ' -f1 | sort | uniq | wc -l
echo -n "  test: "; cat /workspace/fasttext/test.txt | cut -d ' ' -f1 | sort | uniq | wc -l

echo "Least frequent categories in train:"
cat /workspace/fasttext/train.txt | cut -d ' ' -f1 | sort | uniq -c | sort -n | head -n5

#~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/categories_model
#echo "Testing on test_balanced: "; ~/fastText-0.9.2/fasttext test /workspace/fasttext/categories_model.bin /workspace/fasttext/test_balanced.txt
#echo "Testing on test: "; ~/fastText-0.9.2/fasttext test /workspace/fasttext/categories_model.bin /workspace/fasttext/test.txt