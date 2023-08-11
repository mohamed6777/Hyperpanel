configfile: "config/config.yaml"
# Define the target rule
rule all:
	input:
		expand("results/filtered/TSO500/Filter2/f2.{dataset}.vcf", dataset=config["DATASET"])

include: "workflow/rules/filter2.smk"
include: "workflow/rules/sigplotting.smk"
include: "workflow/rules/filter1.smk"