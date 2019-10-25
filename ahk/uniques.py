import argparse


def manage_command_line():
    parser = argparse.ArgumentParser(description='Locate and print unique lines between two files')
    #
    parser.add_argument('file_1', type=str, help='First file to compare')
    parser.add_argument('file_2', type=str, help='Second file to compare')
    argums = parser.parse_args()
    return argums


if __name__ == "__main__":
    params = manage_command_line()
    file_1 = params.file_1
    file_2 = params.file_2

    file_contents = {1: [], 2: [], 'unique': {1:[], 2:[]}}
    for ix, a_file in enumerate((file_1, file_2), start=1):
        with open(a_file, "r") as f:
            raw_contents = f.readlines()
        file_contents[ix] = [x.strip() for x in raw_contents]

    all_contents_deduped = list(set(file_contents[1] + file_contents[2]))
    for a_line in all_contents_deduped:
        if a_line not in file_contents[1]:
            file_contents['unique'][2].append(a_line)
        if a_line not in file_contents[2]:
            file_contents['unique'][1].append(a_line)

    for ix_file, a_file in enumerate((file_1, file_2), start=1):
        for ix_linea_unique_line, a_linea in enumerate(file_contents['unique'][ix_file]):
            if ix_linea_unique_line == 0:
                print(">>> UNIQUE lines found in file '{fname}'".format(fname=a_file))
            print("  * {}".format(a_linea))
