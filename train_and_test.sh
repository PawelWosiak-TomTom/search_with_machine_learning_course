#!/bin/bash
set -x
echo "Test on '-wordNgrams 2': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.1': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.3': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.5': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.5
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 1.0': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 1.0
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.1 -epoch 10': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.1 -epoch 10
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.1 -epoch 15': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.1 -epoch 15
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.1 -epoch 20': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.1 -epoch 20
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-wordNgrams 2 -lr 0.1 -epoch 25': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -wordNgrams 2 -lr 0.1 -epoch 25
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.1': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.3': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.5': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.5
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 1.0': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 1.0
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.1 -epoch 10': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.1 -epoch 10
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.1 -epoch 15': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.1 -epoch 15
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.1 -epoch 20': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.1 -epoch 20
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5

echo "Test on '-lr 0.1 -epoch 25': "
~/fastText-0.9.2/fasttext supervised -input /workspace/datasets/train.txt -output /workspace/datasets/model -lr 0.1 -epoch 25
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 1
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 3
~/fastText-0.9.2/fasttext test /workspace/datasets/model.bin /workspace/datasets/test.txt 5
