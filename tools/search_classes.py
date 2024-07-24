import os
import re
import argparse

def scan_for_kat_classes(directory):
    kat_class_occurrences = []
    kat_class_pattern = re.compile(r'^\s*class\s+(kat_\w+)')

    # Specify the files to scan
    files_to_scan = ['CfgWeapons.hpp', 'CfgMagazines.hpp']

    for root, _, files in os.walk(directory):
        for file in files:
            if file in files_to_scan:
                file_path = os.path.join(root, file)
                with open(file_path, 'r', errors='ignore') as f:
                    lines = f.readlines()
                    for line in lines:
                        match = kat_class_pattern.match(line)
                        if match:
                            class_name = match.group(1)
                            # Extract directory name (part after 'addons/')
                            relative_path = os.path.relpath(root, directory)
                            dir_name = relative_path.split(os.sep)[0].capitalize()
                            kat_class_occurrences.append(f"{dir_name}: {class_name}")
    return kat_class_occurrences

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Scan for kat_ classes.")
    parser.add_argument("--markdown", action="store_true", help="Output in markdown format")
    args = parser.parse_args()

    directory_to_scan = os.path.join(os.path.dirname(__file__), '../addons')
    kat_class_occurrences = scan_for_kat_classes(directory_to_scan)

    if args.markdown:
        for occurrence in kat_class_occurrences:
            print(f"- {occurrence}")
    else:
        with open(os.path.join(os.path.dirname(__file__), 'class_list.txt'), 'w') as f:
            for occurrence in kat_class_occurrences:
                f.write(f"{occurrence}\n")

        print("KAT class occurrences have been written to class_list.txt")
