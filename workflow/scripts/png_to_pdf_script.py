from PIL import Image

def png_to_pdf(png_path, output_pdf_path):
    # Open the image
    image = Image.open(png_path)
    
    # Convert to 'RGB' before saving as PDF to avoid potential errors
    img_rgb = image.convert('RGB')
    
    # Save as a PDF
    img_rgb.save(output_pdf_path)

if __name__ == '__main__':
    png_to_pdf(snakemake.input.png, snakemake.output.pdf)
