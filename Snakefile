configfile: "config/config.yaml"

# Define the target rule
rule all:
    input:
        expand("results/plots/TSO500/Filter0/{dataset}_SBS96.pdf", dataset=config["DATASET"])

# Define the modified rule sigprofiler
include: "workflow/rules/sigplotting.smk"