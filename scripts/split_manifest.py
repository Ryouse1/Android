#!/usr/bin/env python3
# usage: python3 split_manifest.py <in_manifest.xml> <parts> <outdir>
import sys, os, math, xml.etree.ElementTree as ET
if len(sys.argv) < 4:
    print("Usage: split_manifest.py <in_manifest.xml> <parts> <outdir>")
    sys.exit(1)
infile, parts, outdir = sys.argv[1], int(sys.argv[2]), sys.argv[3]
os.makedirs(outdir, exist_ok=True)
tree = ET.parse(infile)
root = tree.getroot()
projects = [p for p in root.findall('project')]
n = len(projects)
size = math.ceil(n/parts)
for i in range(parts):
    part_root = ET.Element('manifest')
    # copy non-project children
    for child in root:
        if child.tag != 'project':
            part_root.append(child)
    start, end = i*size, min((i+1)*size, n)
    for p in projects[start:end]:
        part_root.append(p)
    out = ET.ElementTree(part_root)
    outpath = os.path.join(outdir, f'manifest-part-{i+1}.xml')
    out.write(outpath, encoding='utf-8', xml_declaration=True)
    print("Wrote", outpath)
