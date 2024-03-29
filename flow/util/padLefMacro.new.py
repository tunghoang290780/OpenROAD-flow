#!/usr/bin/env python3
import re
import sys
import os
import argparse  # argument parsing

# Parse and validate arguments
# ==============================================================================
parser = argparse.ArgumentParser(
    description='Adds padding to the right of all macros in a lef file')
parser.add_argument('--right', '-r', required=True, type=int,
                    help='Padding on the right in SITE widths')
parser.add_argument('--right', '-l', required=True, type=int,
                    help='Padding on the left in SITE widths')
parser.add_argument('--site', '-s', required=True, type=int,
                    help='Lef SITE')
parser.add_argument('--exclude', '-e', required=False,
                    default='ENDCAPTIE* CNRCAP* INCNR* TBCAP* FILL* WELLTAP* tsmc65lp_*',
                    help='exclude')
parser.add_argument('--inputLef', '-i', required=True,
                    help='Input LEF')
parser.add_argument('--outputLef', '-o', required=True,
                    help='Output LEF')
args = parser.parse_args()


# Function to parse SITE width from inputLef
def get_site_width(content):
  site_struct = []
  add_to_struct = False

  lef = content.split('\n')

  for line in lef:
    if re.search("^SITE", line):
      add_to_struct = True
    if add_to_struct:
      site_struct.append(line)

      if re.search("^END", line):
        break
  for prop in site_struct:
    site_prop = re.search("^\s*SIZE\s([0-9\.]*)\sBY", prop)
    if site_prop:
      return float(site_prop.group(1))
  raise ValueError("SIZE property of SITE not found")

# Function used by re.sub
def replace_pad(match):
  m = match.groups()
  skip = 0

  # Check if it's a MACRO to be skipped
  for pattern in args.exclude.split():
    if re.match(pattern, m[0]):
      print('Skipping LEF padding for MACRO ', m[0])
      skip = 1
      break

  # Don't pad if skip
  if skip:
    new_x = m[2]
  else:
    new_x = str(round(float(m[2]) + cell_padding, 2))

  replace = r"MACRO " + m[0] + m[1] + "SIZE " + new_x + " BY " + m[3] + m[4] + "END"
  return replace

print(os.path.basename(__file__),": Padding technology lef file")

# Read input file
f = open(args.inputLef)
content = f.read()
f.close()

# Set padding
sitePattern = r"SITE\s" + args.site + ".*?SIZE\s(\S+)\sBY\s(\S+)"
m = re.search(sitePattern, content)

site_width = int(m.groups(1))
cell_padding = float(args.padding) * site_width

print("Cell padding (in SITE widths): " + str(args.padding))
print("Derived SITE width: " + str(site_width))
print("Cell padding: " + str(cell_padding))

# # Perform match
# pattern = r"MACRO\s+(\S+)(.*?)SIZE (\S+) BY (\S+)(.*?)END"
# result, count = re.subn(pattern, replace_pad, content, 0, re.S)

# # Write output file
# f = open(args.outputLef, "w")
# f.write(result)
# f.close()

# # Check
# if count < 1:
#   print("WARNING: Replacement pattern not found")
#   # sys.exit(1)

# print(os.path.basename(__file__),": Finished")
