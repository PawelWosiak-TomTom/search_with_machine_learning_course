import os
import argparse
import re
from pathlib import Path
from nltk.stem import SnowballStemmer

stemmer = SnowballStemmer('english')

def transform_training_data(title, comment):
    line = title + ' ' + comment
    line = re.sub(r'[\W]+', ' ', line) #remove all non-alphanumeric
    # line = " ".join((stemmer.stem(token) for token in line.split()))
    line = line.lower()
    return line

def simplify_scale(rating):
    if ('0.0' == rating or '1.0' == rating or '2.0' == rating):
        return 'negative'
    elif ('3.0' == rating ):
        return 'neutral'
    if ('4.0' == rating or '5.0' == rating):
        return 'positive'
    else:
        print("Unhandled rating: %s" % rating)
        return "unknown"

# Directory for review data
directory = r'/workspace/datasets/product_data/reviews/'
parser = argparse.ArgumentParser(description='Process some integers.')
general = parser.add_argument_group("general")
general.add_argument("--input", default=directory,  help="The directory containing reviews")
general.add_argument("--output", default="/workspace/datasets/fasttext/output.fasttext", help="the file to output to")

args = parser.parse_args()
output_file = args.output
path = Path(output_file)
output_dir = path.parent
if os.path.isdir(output_dir) == False:
        os.mkdir(output_dir)

if args.input:
    directory = args.input


print("Writing results to %s" % output_file)
counter = 0
with open(output_file, 'w') as output:
    for filename in os.listdir(directory):
        if filename.endswith('.xml'):
            with open(os.path.join(directory, filename)) as xml_file:
                for line in xml_file:
                    if '<rating>'in line:
                        rating = simplify_scale(line[12:15])
                    elif '<title>' in line:
                        title = line[11:len(line) - 9]
                    elif '<comment>' in line:
                        comment = line[13:len(line) - 11]
                    elif '</review>'in line:                        
                        output.write("__label__%s %s\n" % (rating, transform_training_data(title, comment)))
                        counter += 1
                        if (counter % 20000 == 0):
                            print("Written %s lines" % counter)
