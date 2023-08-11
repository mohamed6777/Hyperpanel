configfile: "config/config.yaml"
# Define the target rule
rule all:
	input:
		expand("results/plots/TSO500/Filter2/f2.{dataset}_SBS96.pdf", dataset=config["DATASET"])

# include: "workflow/rules/filter2.smk"
# include: "workflow/rules/filter1.smk"
include: "workflow/rules/sigplotting.smk"
