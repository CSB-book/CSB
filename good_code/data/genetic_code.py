import pickle
# load dictionary with genetic code from pickle file
genetic_code = pickle.load(open("../data/genetic_code.pickle", "rb"))

# test case: desired amino acid sequence
# MEFSL[stop]
test_mRNA = "AUGGAAUUCUCGCUCUGAAGGUAA"

def get_amino_acids(mRNA):
    i = 0
    aa_sequence = []
    while (i + 3) < len(mRNA):
        codon = mRNA[i:(i + 3)]
        aa = genetic_code[codon]
        if aa == "Stop":
            break
        else:
            aa_sequence.append(aa)
        # advance to the next codon
        i = i + 4
    return "".join(aa_sequence)

print(get_amino_acids(test_mRNA))
# problem: the program returns MNLLEV instead of MEFSL!
