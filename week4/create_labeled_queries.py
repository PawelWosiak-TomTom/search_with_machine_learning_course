import os
import argparse
import xml.etree.ElementTree as ET
import pandas as pd
import numpy as np
import csv
import re
import string

# Useful if you want to perform stemming.
import nltk

# stemmer = nltk.stem.PorterStemmer()
from nltk.stem.snowball import SnowballStemmer
stemmer = SnowballStemmer("english")


def transform_query(query):
    query = query.lower()
    translator = str.maketrans(string.punctuation, ' '*len(string.punctuation))
    query = query.translate(translator)
    query = ' '.join(query.split())
    query = stemmer.stem(query)
    return query


categories_file_name = r'/workspace/datasets/product_data/categories/categories_0001_abcat0010000_to_pcmcat99300050000.xml'

queries_file_name = r'/workspace/datasets/train.csv'
output_file_name = r'/workspace/fasttext/labeled_query_data.txt'

parser = argparse.ArgumentParser(description='Process arguments.')
general = parser.add_argument_group("general")
general.add_argument("--min_queries", default=1000,  help="The minimum number of queries per category label (default is 1)")
general.add_argument("--output", default=output_file_name, help="the file to output to")

args = parser.parse_args()
output_file_name = args.output

if args.min_queries:
    min_queries = int(args.min_queries)

# The root category, named Best Buy with id cat00000, doesn't have a parent.
root_category_id = 'cat00000'

tree = ET.parse(categories_file_name)
root = tree.getroot()

# Parse the category XML file to map each category id to its parent category id in a dataframe.
categories = []
parents = []
for child in root:
    id = child.find('id').text
    cat_path = child.find('path')
    cat_path_ids = [cat.find('id').text for cat in cat_path]
    leaf_id = cat_path_ids[-1]
    if leaf_id != root_category_id:
        categories.append(leaf_id)
        parents.append(cat_path_ids[-2])
parents_df = pd.DataFrame(list(zip(categories, parents)), columns =['category', 'parent'])
print("%s parent categories loaded from file %s" % ( len(parents_df), categories_file_name ) )

# Read the training data into pandas, only keeping queries with non-root categories in our category tree.
df = pd.read_csv(queries_file_name)[['category', 'query']]
print("%s queries loaded from file %s" % ( len(df), queries_file_name ) )
df = df[df['category'].isin(categories)]
print("%s queries left after removing unknown categories" % ( len(df) ) )

# IMPLEMENT ME: Convert queries to lowercase, and optionally implement other normalization, like stemming.
# df['query'] = df['query'].str.lower()
# df['query'] = df['query'].apply(lambda x: re.sub(r'[\W]+', ' ', x).lower())
df['query'] = df['query'].transform(transform_query)

# IMPLEMENT ME: Roll up categories to ancestors to satisfy the minimum number of queries per category.
print("Unique categories before uplifting: %s" % (len(df['category'].value_counts())))
print("Rarest categories before uplifting:")
print(df['category'].value_counts().tail(5))

max_iterations = 20
category_uplift_iteration = 0
while (len(df['category'].value_counts().loc[lambda x : x < min_queries]) > 0):
    for child, child_count in (df['category'].value_counts().loc[lambda x : x < min_queries]).items():            
        parent = parents_df.loc[parents_df['category'] == child]['parent'].values[0]
        if (child == root_category_id):
            print("cannot uplift to root category for %s" % child )
        else:
            # print("parent for %s is %s" % (child, parent))
            df.loc[df['category'] == child, "category"] = parent # this one works few times faster
            # df.replace({child: parent}, inplace=True)
    
    category_uplift_iteration += 1
    print("Unique categories after uplifting to min %s queries per category [iteration %s]: %s" % (str(min_queries), str(category_uplift_iteration), len(df['category'].value_counts())))
    if category_uplift_iteration >= max_iterations:
        print("max iterations rached - probably min_queries=%s is too high" % min_queries )
        break

print("Rarest categories count after uplifting:")
print(df['category'].value_counts().tail(5))
print("%s queries left after uplifting categories (should remain untouched)" % ( len(df) ) )
# Create labels in fastText format.
df['label'] = '__label__' + df['category']

# Output labeled query data as a space-separated file, making sure that every category is in the taxonomy.
df = df[df['category'].isin(categories)]
print("%s queries left after removing unknown categories" % ( len(df) ) )
df['output'] = df['label'] + ' ' + df['query']
print("%s queries to be saved to %s" % ( len(df) , output_file_name ) )
df[['output']].to_csv(output_file_name, header=False, sep='|', escapechar='\\', quoting=csv.QUOTE_NONE, index=False)
