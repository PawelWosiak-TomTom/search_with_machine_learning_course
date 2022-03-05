import os
import random
import xml.etree.ElementTree as ET
import argparse
from pathlib import Path

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
    # IMPLEMENT
    return name.replace('\n', ' ')


def transform_line(line):
    cat = line.split(' ')[0]
    product_tab = line.split(' ')[1:]
    product_str = ' '.join(product_tab)
    product_transformed = transform_training_data(product_str)
    return product_transformed

# Directory for product data

print("Processing %s" % input_file)
print("Writing results to %s" % output_file)
with open(output_file, 'w') as output:
    for line in open(input_file):
        if random.random() > sample_rate:
            continue
        product_transformed = transform_line(line)
        output.write(product_transformed + "\n")        
