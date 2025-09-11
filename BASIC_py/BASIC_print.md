import sys

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 print_.py <file>")
        sys.exit(1)
    
    FILE_NAME = sys.argv[1]



    import nbformat
    from nbconvert import HTMLExporter
    from nbconvert.preprocessors import Preprocessor
    #
    from datetime import datetime
    today_date = datetime.now().strftime("%Y%m%d_%H%M")
    #
    class RemoveCodeCellPreprocessor(Preprocessor):
        def preprocess(self, nb, resources):
            new_cells = []
            for cell in nb.cells:
                if cell.cell_type == 'code':
                    # Create a new markdown cell containing the outputs
                    output_cell = nbformat.v4.new_markdown_cell()
                    for output in cell.outputs:
                        if output.output_type in ['stream'] and 'text' in output:
                            output_cell.source += f'<pre>{output.text}</pre>'
                        elif output.output_type in ['execute_result', 'display_data']:
                            for mime_type, content in output.data.items():
                                if mime_type == 'text/html':
                                    output_cell.source += content
                                elif mime_type == 'text/plain':
                                    output_cell.source += f'<pre>{content}</pre>'
                                elif mime_type == 'image/png':
                                    output_cell.source += f'<img src="data:image/png;base64,{content}" />'
                    new_cells.append(output_cell)
                else:
                    new_cells.append(cell)
            nb.cells = new_cells
            return nb, resources

    # Load the notebook
    with open(f'{FILE_NAME}', 'r', encoding='utf-8') as file:
        notebook_content = nbformat.read(file, as_version=4)

    # Create the custom HTML exporter
    html_exporter = HTMLExporter()
    html_exporter.register_preprocessor(RemoveCodeCellPreprocessor, enabled=True)

    # Convert to HTML
    (html_body, _) = html_exporter.from_notebook_node(notebook_content)

    
    # Save the HTML
    outFILE_NAME=FILE_NAME.split(".ipynb")[0]
    with open(f'./{today_date}_{outFILE_NAME}_.html', 'w', encoding='utf-8') as file:
        file.write(html_body)

if __name__ == "__main__":
    main()