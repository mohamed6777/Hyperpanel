#!/usr/bin/env python3
import vcf
# The calculated values need to be adjusted depending on the Format of the vcf File
# Read the VCF file
vcf_reader = vcf.Reader(filename="0103T.vcf")

# Create a new VCF writer to write the output
vcf_writer = vcf.Writer(open("0103T_AAF_ann.vcf", "w"), vcf_reader)

# Loop through the variants
for variant in vcf_reader:
    # Check if DP and AO values are present
    if variant.INFO.get("DP") is not None and variant.INFO.get("AO") is not None:
        # Calculate the AAF value
        AAF = int(variant.INFO["AO"]) / int(variant.INFO["DP"])

        # Add the AAF value as a new INFO field
        variant.INFO["AAF"] = AAF

    # Write the variant to the output file
    vcf_writer.write_record(variant)

# Close the VCF writer
vcf_writer.close()