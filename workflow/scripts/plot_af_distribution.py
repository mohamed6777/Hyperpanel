#!/usr/bin/env python3
import vcf
import matplotlib.pyplot as plt
import argparse

def plot_af_distribution(input_vcf, output_png):
    # Reading the vcf file
    vcf_reader = vcf.Reader(filename=input_vcf)

    # List to store the AF values
    af_values = []

    # Loop through the records
    for record in vcf_reader:
        if "AF" in record.samples[0].data._fields:
            af = record.samples[0].data.AF
            if af is not None and isinstance(af, (float, int)):
                af_values.append(af)

    # Plotting the AF values
    plt.hist(af_values, bins=50, edgecolor="black")

    # Adding labels and title to the plot
    plt.xlabel("Allele Frequency (AF)")
    plt.ylabel("Count")
    plt.title("Allele Frequency (AF) Distribution")

    # Saving the plot as a PNG image
    plt.savefig(output_png)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Plot AF distribution from VCF")
    parser.add_argument("input_vcf", help="Input VCF file")
    parser.add_argument("output_png", help="Output PNG file for the plot")
    args = parser.parse_args()

    plot_af_distribution(args.input_vcf, args.output_png)
