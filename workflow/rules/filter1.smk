rule Filter1_variants:
    input:
        "/fast/projects/hyperpanel/work/vcfs/TSO500/{dataset}.vcf"
    output:
        "results/filtered/TSO500/Filter1/f1.{dataset}.vcf"
    threads: 4
    resources:
        parallel_star=1,
        mem_mb=6000, 
        time='04:00:00',
    shell:
       """
       snpEff -Xmx8g -v hg19kg {input} | 
       SnpSift filter "!(ALT = '.') & isVariant(GEN[0])" /dev/stdin > {output}
       """