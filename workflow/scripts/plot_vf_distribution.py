#!/usr/bin/env python3
import vcf
import matplotlib.pyplot as plt
import argparse

def plot_vf_distribution(input_vcf, output_png):
    # Reading the vcf file
    vcf_reader = vcf.Reader(filename=input_vcf)

    # List to store the VF values
    vf_values = []

    # Loop through the records
    for record in vcf_reader:
        if "VF" in record.samples[0].data._fields:
            vf = record.samples[0].data.VF
            if vf is not None and isinstance(vf, (float, int)):
                vf_values.append(vf)

    # Plotting the VF values
    plt.hist(vf_values, bins=50, edgecolor="black")

    # Adding labels and title to the plot
    plt.xlabel("Variant Frequency (VF)")
    plt.ylabel("Count")
    plt.title("Variant Frequency (VF) Distribution")

    # Saving the plot as a PNG image
    plt.savefig(output_png)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Plot VF distribution from VCF")
    parser.add_argument("input_vcf", help="Input VCF file")
    parser.add_argument("output_png", help="Output PNG file for the plot")
    args = parser.parse_args()

    plot_vf_distribution(args.input_vcf, args.output_png)
