import sys

def split_text(input_filename, output_filename, width):
    # 读取输入文件内容
    with open(input_filename, 'r', encoding='gb18030') as f:
        text = f.read()

    # 按指定宽度分割文本
    lines = [text[i:i+width] for i in range(0, len(text), width)]

    # 写入输出文件
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write("/*\n")  # 写入第一行
        for line in lines:
            f.write(line + '\n')
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
