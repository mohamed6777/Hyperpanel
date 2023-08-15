rule Filter3_variants:
    input:"results/filtered/TSO500/Filter2/f2.{dataset}.vcf"
    output:"results/filtered/TSO500/Filter3/f3.{dataset}.vcf"
    threads: 4
    resources:
        parallel_star=1,
        mem_mb=20000,  # Default to 1; you can adjust this as needed.
        time='04:00:00',   
    shell:"SnpSift filter '(GEN[0].VF > 0.05)'  {input} > {output}"
        
