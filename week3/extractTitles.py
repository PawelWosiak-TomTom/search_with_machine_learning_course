import os
import random
import xml.etree.ElementTree as ET
import argparse
import re
from pathlib import Path
from nltk.stem import SnowballStemmer

stemmer = SnowballStemmer('english')
parser = argparse.ArgumentParser(description='Process some integers.')
general = parser.add_argument_group("general")
general.add_argument("--input", default="/workspace/datasets/fasttext/full.fasttext",  help="The file containing the products in fasttext format")
general.add_argument("--output", default="/workspace/datasets/fasttext/titles.txt", help="the file to output to")

# Consuming all of the product data takes a while. But we still want to be able to obtain a representative sample.
general.add_argument("--sample_rate", default=1, type=float, help="The rate at which to sample input (default is 0.1)")

args = parser.parse_args()
input_file = args.input
output_file = args.output
path = Path(output_file)
output_dir = path.parent
if os.path.isdir(output_dir) == False:
        os.mkdir(output_dir)

sample_rate = args.sample_rate


def transform_training_data(name):
    name = name.replace('\n', ' ')
    name = re.sub(r'[\W]+', ' ', name) #remove all non-alphanumeric
    # name = " ".join((stemmer.stem(token) for token in name.split()))
    name = name.lower()
    return name


def transform_line(line):
    cat = line.split(' ')[0]
    product_tab = line.split(' ')[1:]
    product_str = ' '.join(product_tab)
    product_transformed = transform_training_data(product_str)
    return product_transformed

# Directory for product data

filtered_in = 0
filtered_out = 0
print("Processing %s" % input_file)
print("Writing to %s" % output_file)
with open(output_file, 'w') as output:
    for line in open(input_file):
        if random.random() > sample_rate:
            filtered_out += 1
            continue
        product_transformed = transform_line(line)
        output.write(product_transformed + "\n")        
        filtered_in += 1

print("Saved lines %s (%s%%), filtered out due to 'sample_rate=%s' lines %s (sum: lines %s)" 
    % (filtered_in, int(100*filtered_in/(filtered_in + filtered_out)),
    sample_rate, 
    filtered_out,
    filtered_in + filtered_out))
