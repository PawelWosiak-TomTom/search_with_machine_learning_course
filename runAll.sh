DIR=/workspace/datasets/reviews
python /workspace/search_with_machine_learning_course/week3/createReviewLabels.py --output /workspace/datasets/reviews/output.fasttext

shuf $DIR/output.fasttext > $DIR/random.fasttext
echo -n "lines at start: " 
wc -l $DIR/random.fasttext
cat $DIR/random.fasttext  | cut -d ' ' -f1 | sort | uniq -c
head -n 176000 $DIR/random.fasttext > $DIR/train-unbalanced.fasttext 
tail -n 44000 $DIR/random.fasttext > $DIR/test.fasttext
echo "train labels count before balancing: " 
cat $DIR/train-unbalanced.fasttext  | cut -d ' ' -f1 | sort | uniq -c
#cat $DIR/test.fasttext | cut -d ' ' -f1 | sort | uniq -c

rm $DIR/train-balanced.fasttext # need to cleanup first, as will 'append'

# cat $DIR/train-unbalanced.fasttext | grep '__label__1.0' | head -n 7800 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__2.0' | head -n 7800 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__3.0' | head -n 7800 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__4.0' | head -n 7800 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__5.0' | head -n 7800 >> $DIR/train-balanced.fasttext

cat $DIR/train-unbalanced.fasttext | grep -v '__label__0.0' > $DIR/train-balanced.fasttext

# cat $DIR/train-unbalanced.fasttext | grep '__label__negative' | head -n 23000 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__neutral' | head -n 10000 >> $DIR/train-balanced.fasttext
# cat $DIR/train-unbalanced.fasttext | grep '__label__positive' | head -n 140000 >> $DIR/train-balanced.fasttext

shuf $DIR/train-balanced.fasttext > $DIR/train-balanced-random.fasttext
echo -n "lines in train: "; wc -l $DIR/train-balanced-random.fasttext
echo -n "lines in test : "; wc -l $DIR/test.fasttext
echo "labels after balancing: "
cat $DIR/train-balanced-random.fasttext | cut -d ' ' -f1 | sort | uniq -c

~/fastText-0.9.2/fasttext supervised -input $DIR/train-balanced-random.fasttext -output $DIR/model_reviews -wordNgrams 3
~/fastText-0.9.2/fasttext test $DIR/model_reviews.bin $DIR/test.fasttext
