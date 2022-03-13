#!/bin/bash
for NGRAMS in "" "-wordNgrams 2" "-wordNgrams 3"
do
    for LR in 0.1 0.3 0.5 0.9 
    do
        for EPOCH in 5 15 25
        do
            echo "$(date +"%Y-%m-%d %T") - Test on '-lr $LR -epoch $EPOCH $NGRAMS': "
            ~/fastText-0.9.2/fasttext supervised -input /workspace/fasttext/train.txt -output /workspace/fasttext/model -lr $LR -epoch $EPOCH $NGRAMS
            ~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 1
            ~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 3
            ~/fastText-0.9.2/fasttext test /workspace/fasttext/model.bin /workspace/fasttext/test.txt 5
        done    
    done
done