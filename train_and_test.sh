#!/bin/bash
echo "$(date +"%Y-%m-%d %T") - Test on '-epoch 1': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -epoch 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.1': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.3': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.5': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.5
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.9': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.9
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.1': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.3': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.5': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.5
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.9': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.9
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.5 -epoch 10': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.5 -epoch 10
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.5 -epoch 15': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.5 -epoch 15
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.5 -epoch 20': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.5 -epoch 20
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 2 -lr 0.5 -epoch 25': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 2 -lr 0.5 -epoch 25
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.5 -epoch 10': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.5 -epoch 10
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.5 -epoch 15': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.5 -epoch 15
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.5 -epoch 20': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.5 -epoch 20
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-lr 0.5 -epoch 25': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr 0.5 -epoch 25
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5

echo "$(date +"%Y-%m-%d %T") - Test on '-wordNgrams 3 -lr 0.5 -epoch 15': "
~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -wordNgrams 3 -lr 0.5 -epoch 15
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5
