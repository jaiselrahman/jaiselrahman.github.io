#!/bin/python3

#
# Helper utility to crop image to specific size to be used in project card.
#
# usage: ./img_crop input_file [output_file_name]
#

import os
import sys

from PIL import Image

if not len(sys.argv) in range(2, 4):
    print(f'usage: {os.path.basename(__file__)} input_file [output_file_name]')
    sys.exit()

image_file = sys.argv[1]

try:
    img = Image.open(image_file)
except Exception as e:
    print(f"error: {e}")
    sys.exit()

width, _ = img.size

left = 0
right = width
top = 0
bottom = width * 20 / 15

new_width = 300
new_height = new_width * 20/15

new_image_file = sys.argv[2] if len(sys.argv) > 2 else 'image_cropped'
new_image_file = new_image_file + '.' + img.format.lower()

(img.crop((left, top, right, bottom))
 .resize((300, int(300 * 20/15)))
 .save(new_image_file, format=img.format))
