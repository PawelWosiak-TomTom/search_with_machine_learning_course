import argparse
import os
import random
import xml.etree.ElementTree as ET
from pathlib import Path
from collections import defaultdict

def transform_name(product_name):
    return product_name.lower()

parser = argparse.ArgumentParser(description='Process some integers.')
general = parser.add_argument_group("general")
general.add_argument("--input", default="/workspace/datasets/fasttext/output.fasttext",  help="Input fasttext file")
general.add_argument("--outputTrain", default="/workspace/datasets/fasttext/train.fasttext", help="the file to output train set to")
general.add_argument("--outputTest", default="/workspace/datasets/fasttext/test.fasttext", help="the file to output test set to")

# Consuming all of the product data will take over an hour! But we still want to be able to obtain a representative sample.
general.add_argument("--sample_rate", default=1.0, type=float, help="The rate at which to sample input (default is 1.0)")

# IMPLEMENT: Setting min_products removes infrequent categories and makes the classifier's task easier.
general.add_argument("--min_products", default=100, type=int, help="The minimum number of products per category (default is 0).")

args = parser.parse_args()
output_file_train = args.outputTrain
output_file_test = args.outputTest

input_file = args.input
min_products = args.min_products
sample_rate = args.sample_rate

dd = defaultdict(list)
print("Processing %s" % input_file)
print("Writing test results to %s" % output_file_test)
with open(output_file_test, 'w') as output_test:
    for line in open(input_file):
        r = random.randint(0, 100)
        if r < 50:
            output_test.write(line)
        else:
            cat = line.split(' ')[0]
            product_tab = line.split(' ')[1:]
            product_str = ' '.join(product_tab)
            product_transformed = transform_name(product_str)
            dd[cat].append(product_transformed)

filtered_out_lines = 0
filtered_in_lines = 0
filtered_out_categories = 0
filtered_in_categories = 0
print("Distinct categories count: %s" % len(dd))
print("Writing results to %s" % output_file_train)
with open(output_file_train, 'w') as output_train:
    for (cat, lines) in dd.items():
        if (len(lines) > min_products):            
            filtered_in_categories += 1
            for line in lines:
                output_train.write(cat + ' ' + line)
                filtered_in_lines += 1
        else:
            filtered_out_categories += 1
            filtered_out_lines += len(lines)

print("Saved: lines %s (%s%%), categories %s (%s%%), filtered out due to 'min_products=%s' lines %s, categories %s (sum: lines %s, categories %s)" 
    % (filtered_in_lines, int(100*filtered_in_lines/(filtered_in_lines + filtered_out_lines)),
    filtered_in_categories, int(100*filtered_in_categories/(filtered_in_categories + filtered_out_categories)),
    min_products, 
    filtered_out_lines, filtered_out_categories, 
    filtered_in_lines + filtered_out_lines,
    filtered_in_categories + filtered_out_categories))

