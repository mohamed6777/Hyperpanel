
rule Filter2_variants:
    input:
        "results/filtered/TSO500/Filter1/f1.{dataset}.vcf"
    output:
        "results/filtered/TSO500/Filter2/f2.{dataset}.vcf"
    threads: 4
    resources:
        parallel_star=1,
        mem_mb=20000,  # Default to 1; you can adjust this as needed.
        time='04:00:00',   
    shell:
       "snpEff -Xmx8g -v hg19kg {input} | "
       "SnpSift annotate -exists -v gnomad resources/gnomad.exomes.r2.0.2.sites.vcf.gz /dev/stdin | "
       "SnpSift filter -n ' (exists ID) & !( ID = 'gnomad' )' /dev/stdin > {output}"