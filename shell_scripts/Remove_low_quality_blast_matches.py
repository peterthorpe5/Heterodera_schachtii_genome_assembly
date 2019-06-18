##############################################################################
# Title: reduces blast tab output based on thrshold, evalue or bit score.
###############################################################################

"""filters the file based on  thresholds"""

usage = """
usage =

python Remove_low_quality_blast_matches.py blast_tab_file,outfile, threshold

e.g.  python Remove_low_quality_blast_matches.py all_vs_all.abc all_vs_all_20.abc 1e-20

"""

# print(usage)

import os
import sys
from sys import stdin,argv


def filter_file(blast_tab_file, threshold, outfile):
    """returns blast matches under thrsheold evalue
    """
    f_out = open(outfile, 'w')
    blast_tab_file = open(blast_tab_file, 'r')
    threshold = float(threshold)
    for line in blast_tab_file:
        data = line.split('\t')
        evalue = data[10].rstrip()  # currently a str
        if float(evalue) <= float(threshold):
            f_out.write(line)
    f_out.close()
    blast_tab_file.close()

filter_file (argv[1], argv[2], argv[3])

