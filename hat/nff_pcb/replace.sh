#!/bin/bash

# Script for mass editing fields. This should only have to be run once.
# First install kifield $ pip install kifield
# https://xess.com/KiField/docs/_build/singlehtml/index.html
# Running: ./replace.sh hardware # You don't need the sch part

# Please note:
# diff --git a/kifield/kifield.py b/kifield/kifield.py
# index bdb5b2d..6bebd72 100644
# --- a/kifield/kifield.py
# +++ b/kifield/kifield.py
# @@ -1329,7 +1329,8 @@ def clean_part_fields(part_fields_dict):
#      """Clean field values (i.e., remove or replace any newlines with spaces.)"""
#      for part, fields in part_fields_dict.items():
#          for k, v in fields.items():
# -            v = re.sub("[\n\r]+$", "", v) # Remove newlines at end of field.
# +            print("{}: {}".format(part, type(v)))
# +            v = re.sub("[\n\r]+$", "", str(v)) # Remove newlines at end of field.
#              fields[k] = re.sub("[\n\r]+", " ", v) # Replace newlines within field.
#
# PR Here: https://github.com/xesscorp/KiField/pull/64


kifield -x hardware.sch -i output.xlsx --group --overwrite --nobackup -r
read -n 1 -p "Edit output.csv and Press enter!" mainmenuinput
kifield -x output.xlsx -i hardware.sch --group --overwrite --nobackup -r 
