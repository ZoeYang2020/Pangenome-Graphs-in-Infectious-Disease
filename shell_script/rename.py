# read in genome IDs and corresponding names
id_to_name = {}
with open("GCFID_IDs_130NM") as f:
    for line in f:
        id, name = line.strip().split("\t")
        id_to_name[id] = name

# replace genome IDs with names in fasta file
with open("ska_NM130_variants.aln") as f:
    with open("ska_NM130_variants_rename.aln", "w") as fout:
        for line in f:
            if line.startswith(">"):
                id = line.strip().lstrip(">")
                name = id_to_name.get(id, "Unknown")
                fout.write(f">{name}\n")
            else:
                fout.write(line)
