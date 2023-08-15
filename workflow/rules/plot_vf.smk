#pyvcf_env
rule plot_vf:
    input:
        vcf="results/filtered/TSO500/Filter3/f3.{dataset}.vcf"
    output:
        png="results/plots/VFplots/Filter3/{dataset}.vf_distribution.png"
    shell:
        "python workflow/scripts/plot_vf_distribution.py {input.vcf} {output.png}"