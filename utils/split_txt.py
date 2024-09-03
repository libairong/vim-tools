import sys

def split_text(input_filename, output_filename, width):
    # 读取输入文件内容
    with open(input_filename, 'r', encoding='utf-8') as f:
        text = f.read()

    # 分段落处理
    paragraphs = text.split('\n')
    new_paragraphs = []

    for paragraph in paragraphs:
        if not paragraph.strip():
            new_paragraphs.append('')
            continue

        # 保留段首的空格
        indent = len(paragraph) - len(paragraph.lstrip())
        paragraph = paragraph.strip()

        # 按指定宽度分割文本
        lines = [paragraph[i:i+width] for i in range(0, len(paragraph), width)]
        indented_lines = [(' ' * indent) + line for line in lines]

        new_paragraphs.append('\n'.join(indented_lines))

    # 写入输出文件
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write("/*\n")  # 写入第一行
        for paragraph in new_paragraphs:
            f.write(paragraph + '\n\n')
        f.write("*/\n")  # 写入最后一行

if __name__ == "__main__":
    # 从命令行参数获取文件名和宽度
    if len(sys.argv) != 4:
        print("Usage: python script.py <input_file> <output_file> <width>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    width = int(sys.argv[3])

    # 确保输出文件名的扩展名为 .c
    if not output_file.endswith('.c'):
        output_file += '.c'

    split_text(input_file, output_file, width)

