#!/usr/bin/env python
# encoding: utf-8
"""
In the spirit of python's json.tool, provide a command line
utility to pretty print XML.

Usage ():

    $ echo "<book><title>Oliver Twist</title></book>" | python -m xmltool
    <?xml version="1.0" encoding="utf-8"?>
    <book>
        <title>
            Oliver Twist
        </title>
    </book>
    
    $ curl -s http://api.twitter.com/version/help/test.xml | python -m xmltool
    <?xml version="1.0" encoding="utf-8"?>
    <ok>
        true
    </ok>
    
    $ python xmltool.py infile.xml
    
    $ python xmltool.py infile.xml outfile.xml
    
"""

import sys
from xml.dom import minidom

def main():
    if len(sys.argv) == 1:
        infile = sys.stdin
        outfile = sys.stdout
    elif len(sys.argv) == 2:
        infile = open(sys.argv[1], 'rb')
        outfile = sys.stdout
    elif len(sys.argv) == 3:
        infile = open(sys.argv[1], 'rb')
        outfile = open(sys.argv[2], 'wb')
    else:
        raise SystemExit(sys.argv[0] + ' [infile [outfile]]')
    try:
        dom = minidom.parse(infile)
    except Exception as e:
        raise SystemExit(e)
    prettyxml = dom.toprettyxml(indent=' '*4, encoding='utf-8')
    outfile.write(prettyxml)
    outfile.write('\n')
        
if __name__ == '__main__':
    main()

