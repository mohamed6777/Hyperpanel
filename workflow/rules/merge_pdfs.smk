rule merge_pdfs:
    input:
        file1='results/plots/TSO500/Filter0/{dataset}_SBS96.pdf',
        file2='results/plots/TSO500/Filter2/f2.{dataset}_SBS96.pdf',
        file3='results/plots/TSO500/Filter3/f3.{dataset}_SBS96.pdf',
        file4='results/plots/decomposition/Filter2/{dataset}.decomposition.pdf',
        file5='results/plots/decomposition/Filter3/{dataset}.decomposition.pdf',
        file6='results/plots/VFplots/Filter2/{dataset}.pdf',
        file7='results/plots/VFplots/Filter3/{dataset}.pdf'
    output:
        merged='results/plots/Merged/{dataset}.merged.pdf'
    script:
        'workflow/scripts/pdf_merge.py'