#!/usr/bin/env python3
import os, random, string, sys

SUBFOLDER = sys.argv[1]

# Words to preserve exactly
PRESERVE_WORDS = ["latex", "mermaid", "d2"]

def random_char(c):
    # don't randomize whitespace
    if c.isspace():
        return c
    # random lowercase letter (change to ascii_letters if you want broader)
    return random.choice(string.ascii_lowercase)

def process_text_line(line):
    """Replace characters randomly except preserve specific words"""
    result = []
    i = 0
    while i < len(line):
        replaced = False
        # check preserve words
        for w in PRESERVE_WORDS:
            if line[i:].startswith(w):
                result.append(w)
                i += len(w)
                replaced = True
                break
        if replaced:
            continue
        # keep markdown symbols
        if line[i] in "#*[](){}<>_`~+-!|:":
            result.append(line[i])
        else:
            result.append(random_char(line[i]))
        i += 1
    return "".join(result)

def process_markdown(path):
    out = []
    inside_fence = False
    fence_marker = None

    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            stripped = line.strip()

            # entering or leaving code fence?
            if stripped.startswith("```"):
                # toggle state
                if not inside_fence:
                    inside_fence = True
                    fence_marker = stripped
                else:
                    inside_fence = False
                out.append(line)
                continue

            if inside_fence:
                # DO NOT TOUCH CODE BLOCK CONTENT
                out.append(line)
            else:
                out.append(process_text_line(line))

    with open(path, "w", encoding="utf-8") as f:
        f.write("".join(out))

# Walk subfolder
for root, _, files in os.walk(SUBFOLDER):
    for fname in files:
        if fname.endswith(".md") or fname.endswith(".qmd"):
            process_markdown(os.path.join(root, fname))
