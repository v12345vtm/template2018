import re
import argparse


def manage_command_line():
    parser = argparse.ArgumentParser(description='Locate and print product codes in files')
    parser.add_argument('file', type=str, help='File to extract codes')
    parser.add_argument('-d', '--debug', action='store_true', default=False, help="Print debugging info")
    argums = parser.parse_args()
    return argums


DEBUG = 1

if __name__ == "__main__":
    params = manage_command_line()

    with open(params.file, "r") as f:
        raw_contents = f.readlines()
    raw_contents = [x.strip() for x in raw_contents]

    regex = r"(W[-,=][^:]+)\s*?:"
    regex = r"(W[-,=][^\s:]+)"
    rx = re.compile(regex)
    q =0
    for l in raw_contents:
        rx_found_cases = re.findall(rx, l)
        for ix, found_code in enumerate(rx_found_cases):
            if params.debug:
                if ix == 0:
                    print("{}".format(l))
                print("  >>> ", end='')
            print("{}".format(found_code.strip()))
            q += 1
    if params.debug:
        print("*** found {} codes".format(q))

