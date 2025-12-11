#!/usr/bin/env python3
import sys, os, math, xml.etree.ElementTree as ET

if len(sys.argv) < 4:
    print("Usage: split_manifest.py <default.xml> <parts> <outdir>")
    exit(1)

infile = sys.argv[1]
parts = int(sys.argv[2])
outdir = sys.argv[3]
os.makedirs(outdir, exist_ok=True)

tree = ET.parse(infile)
root = tree.getroot()

projects = [p for p in root.findall("project")]
n = len(projects)
chunk = math.ceil(n / parts)

for i in range(parts):
    part_root = ET.Element("manifest")

    # copy non-project entries
    for child in root:
        if child.tag != "project":
            part_root.append(child)

    start = i * chunk
    end = min((i + 1) * chunk, n)

    for p in projects[start:end]:
        part_root.append(p)

    out = os.path.join(outdir, f"manifest-part-{i+1}.xml")
    ET.ElementTree(part_root).write(out, encoding="utf-8", xml_declaration=True)
    print("Created:", out)
