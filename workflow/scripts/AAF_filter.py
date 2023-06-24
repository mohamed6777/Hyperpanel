#!/usr/bin/env python3
import vcf

# Reading the vcf file
#The calculated values need to be adjusted depending on the Format of the vcf File
vcf_reader = vcf.Reader(filename="0103T.vcf")

# Open a new vcf file to write the filtered variants
with open("0103T_pyvcf_filtered.vcf", "w") as filtered_file:
    # Create a vcf writer
    vcf_writer = vcf.Writer(filtered_file, vcf_reader)

    # Loop through the variants
    for record in vcf_reader:
        # Get the DP and AD values
        DP = record.INFO.get("DP")
        AD = record.INFO.get("AD")

        # Check if the DP and AD values are available
        if DP is not None and AD is not None:
            # Calculate the AAF
            aaf = AD/DP

            # Check if the AAF value is greater than 0.05
            if aaf > 0.05:
                # Write the variant to the filtered vcf file
                vcf_writer.write_record(record)

# Close the vcf writer
vcf_writer.close()