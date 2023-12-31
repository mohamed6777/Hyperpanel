rule generate_matrix:
    input: "results/filtered/TSO500/Filter2/f2.{dataset}.vcf"
    output: "results/matrix/TSO500/{dataset}.SBS96.all"
    threads: 8 # Adjust this value based on the parallelism you want
    resources:
        mem_mb=2000,
        parallel_star=1,
    run:
        import tempfile
        import os
        import shutil

        # Create a unique temporary directory for this job
        temp_dir = tempfile.mkdtemp(prefix=f"sigprofiler_{wildcards.dataset}_", dir="/fast/projects/hyperpanel/work/Hyperpanel")

       # Copy input VCF to the temporary directory
        input_vcf = os.path.join(temp_dir, f"{wildcards.dataset}.vcf")
        shutil.copy(input[0], input_vcf)

        # Run SigProfilerMatrixGenerator using the temporary directory
        from SigProfilerMatrixGenerator.scripts import SigProfilerMatrixGeneratorFunc as matGen 
        matrices = matGen.SigProfilerMatrixGeneratorFunc('test', 'GRCh37', temp_dir, plot=False)

        # Copy the resulting plot to the output directory
        output_pdf = os.path.join(temp_dir, "output/SBS/test.SBS96.all")
        shutil.copy(output_pdf, output[0])

        # Clean up the temporary directory
        shutil.rmtree(temp_dir)