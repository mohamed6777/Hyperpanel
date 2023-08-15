# Function to parse signatures from a given line in your text file
def parse_signatures_from_line(line):
    parts = line.strip().split(", ")
    sample_name = parts[0].split(" ")[1]
    signatures_info = parts[1].split(" & ")
    similarity = float(parts[2])
    
    signatures = []
    for sig_info in signatures_info:
        sig_name, percentage = sig_info.split(" (")
        percentage = float(percentage.rstrip("%)"))
        signatures.append((sig_name, percentage))
    
    return sample_name, signatures, similarity

# Function to plot the circular diagram
import matplotlib.pyplot as plt

def plot_circular_diagram(sample_name, signatures, similarity, output_file):
    labels, sizes = zip(*signatures)
    
    fig, ax = plt.subplots()
    ax.pie(sizes, labels=labels, startangle=90, autopct='%1.1f%%')
    ax.axis('equal')
    plt.title(sample_name)
    
    # Annotate the similarity value
    ax.annotate(f'Similarity: {similarity}', xy=(1,0), xycoords='axes fraction', fontsize=12,
                xytext=(20,-30), textcoords='offset points',
                ha='right', va='bottom')
    
    plt.savefig(output_file, bbox_inches='tight', format='pdf')
    plt.close()


rule plot_signatures:
    input:
        decomposition_txt = "results/decomposition/TSO500/Filter3/{dataset}.decomposition_profile.csv"
    output:
        visualization = "results/plots/decomposition/Filter3/{dataset}.decomposition.pdf"
    params:
        sample = "{dataset}"
    run:
        with open(input.decomposition_txt, 'r') as f:
            next(f)  # Skip the header line
            line = f.readline()  # Assuming one line per dataset in the decomposition file
            sample_name, signatures, similarity = parse_signatures_from_line(line)
            plot_circular_diagram(sample_name, signatures, similarity, output.visualization)