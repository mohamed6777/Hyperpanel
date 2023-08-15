rule png_to_pdf:
    input:
        png='results/plots/VFplots/Filter3/{dataset}.vf_distribution.png'
    output:
        pdf='results/plots/VFplots/Filter3/{dataset}.pdf'
    script:
        '/fast/projects/hyperpanel/work/Hyperpanel/workflow/scripts/png_to_pdf_script.py'