import argparse
import os
import random
import xml.etree.ElementTree as ET
from pathlib import Path
from collections import defaultdict

def transform_name(product_name):
    return product_name.lower()

# Directory for product data
directory = r'/workspace/search_with_machine_learning_course/data/pruned_products/'

parser = argparse.ArgumentParser(description='Process some integers.')
general = parser.add_argument_group("general")
general.add_argument("--input", default=directory,  help="The directory containing product data")
general.add_argument("--output", default="/workspace/datasets/fasttext/output.fasttext", help="the file to output to")

# Consuming all of the product data will take over an hour! But we still want to be able to obtain a representative sample.
general.add_argument("--sample_rate", default=1.0, type=float, help="The rate at which to sample input (default is 1.0)")

# IMPLEMENT: Setting min_products removes infrequent categories and makes the classifier's task easier.
general.add_argument("--min_products", default=100, type=int, help="The minimum number of products per category (default is 0).")

args = parser.parse_args()
output_file = args.output
path = Path(output_file)
output_dir = path.parent
if os.path.isdir(output_dir) == False:
        os.mkdir(output_dir)

if args.input:
    directory = args.input
# IMPLEMENT:  Track the number of items in each category and only output if above the min
min_products = args.min_products
sample_rate = args.sample_rate

print("Writing results to %s" % output_file)
dd = defaultdict(list)
with open(output_file, 'w') as output:
    for filename in os.listdir(directory):
        if filename.endswith(".xml"):
            print("Processing %s" % filename)
            f = os.path.join(directory, filename)
            tree = ET.parse(f)
            root = tree.getroot()
            for child in root:
                if random.random() > sample_rate:
                    continue
                # Check to make sure category name is valid
                if (child.find('name') is not None and child.find('name').text is not None and
                    child.find('categoryPath') is not None and len(child.find('categoryPath')) > 0 and
                    child.find('categoryPath')[len(child.find('categoryPath')) - 1][0].text is not None):
                        # Choose last element in categoryPath as the leaf categoryId
                        cat = child.find('categoryPath')[len(child.find('categoryPath')) - 1][0].text
                        # Replace newline chars with spaces so fastText doesn't complain
                        name = child.find('name').text.replace('\n', ' ')
                        entry = "__label__%s %s\n" % (cat, transform_name(name))
                        dd[cat].append(entry)

    filtered_out_lines = 0
    filtered_in_lines = 0
    filtered_out_categories = 0
    filtered_in_categories = 0
    print("Distinct categories count: %s" % len(dd))
    print("Writing results to %s" % output_file)
    for (cat, lines) in dd.items():
        if (len(lines) > min_products):            
            filtered_in_categories += 1
            for line in lines:
                output.write(line)
                filtered_in_lines += 1
        else:
            filtered_out_categories += 1
            filtered_out_lines += len(lines)
    
    print("Saved: lines %s, categories %s, filtered out due to 'min_products=%s' lines %s, categories %s (sum: lines %s, categories %s)" 
        % (filtered_in_lines, filtered_in_categories, 
        min_products, 
        filtered_out_lines, filtered_out_categories, 
        filtered_in_lines + filtered_out_lines,
        filtered_in_categories + filtered_out_categories))

