from PyPDF2 import PdfFileReader, PdfFileWriter
import os

def merge_pdfs(paths, output_filename):
    pdf_writer = PdfFileWriter()

    for path in paths:
        pdf_reader = PdfFileReader(path)
        for page in range(pdf_reader.getNumPages()):
            pdf_writer.addPage(pdf_reader.getPage(page))

    with open(output_filename, 'wb') as out:
        pdf_writer.write(out)

if __name__ == '__main__':
    # Extract the paths from the snakemake object
    pdfs1 = [snakemake.input.file1, snakemake.input.file2, snakemake.input.file3]
    pdfs2 = [snakemake.input.file4, snakemake.input.file5]
    pdfs3 = [snakemake.input.file6, snakemake.input.file7]
    
    merge_pdfs(pdfs1, output_filename='temp1.pdf')
    merge_pdfs(pdfs2, output_filename='temp2.pdf')
    merge_pdfs(pdfs3, output_filename='temp3.pdf')

    final_pdfs = ['temp1.pdf', 'temp2.pdf', 'temp3.pdf']
    merge_pdfs(final_pdfs, snakemake.output.merged)

    # Cleanup temporary files
    for pdf in final_pdfs:
        os.remove(pdf)
