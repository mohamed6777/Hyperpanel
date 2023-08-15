configfile: "config/config.yaml"


rule all:
    input:
        expand("results/plots/Merged/{dataset}.merged.pdf", dataset=config["DATASET"])

#include:"workflow/rules/png_to_pdf.smk"
 #Rule to merge PDFs

