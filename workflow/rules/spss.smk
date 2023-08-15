rule run_sigproSS_single_sample:
    input: "results/filtered/TSO500/Filter3/f3.{dataset}.vcf"
    output: "results/decomposition/TSO500/Filter3/{dataset}.decomposition_profile.csv"
    threads: 8 # Adjust this value based on the parallelism you want
    resources:
        mem_mb=2000,
        parallel_star=1,
    run:
        import tempfile
        import os
        import shutil
        from sigproSS import spss

        # Create a unique temporary directory for this job
        temp_dir = tempfile.mkdtemp(prefix=f"sigprofiler_{wildcards.dataset}_", dir="/fast/projects/hyperpanel/work/Hyperpanel")

        try:
            # Copy input VCF to the temporary directory
            input_vcf = os.path.join(temp_dir, f"{wildcards.dataset}.vcf")
            shutil.copy(input[0], input_vcf)
            
            # Run sigproSS single_sample
            spss.single_sample(data=temp_dir, output=temp_dir)

            # Copy the resulting plot to the output directory
            output_pdf = os.path.join(temp_dir, "decomposition profile.csv")
            shutil.copy(output_pdf, output[0])
        finally:
            # Clean up: remove temporary directory
            shutil.rmtree(temp_dir)