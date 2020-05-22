from os import listdir, rename
from os.path import isfile
from re import sub


def clean_file_names(directory_path, recursive):
    for file_name in listdir(directory_path):
        # Get the file path for each operating system
        file_path = append_file_name_to_path(directory_path, file_name)

        # If a file, rename to clean it
        if isfile(file_path):
            new_file_name = sub(r"[^A-Za-z0-9_.]", "",
                                sub(r" |-", "_", file_name)).lower()
            new_file_path = append_file_name_to_path(
                directory_path, new_file_name)
            rename(file_path, new_file_path)

        # If a directory, and if recursive, run recursively on the given directory
        elif recursive:
            clean_file_names(file_path, recursive)


def append_file_name_to_path(directory_path, file_name):
    file_path = directory_path + file_name
    if (directory_path.find("\\") >= 0 and directory_path.rfind("\\") != len(directory_path) - 1):
        file_path = directory_path + "\\" + file_name
    elif (directory_path.find("/") >= 0 and directory_path.rfind("/") != len(directory_path) - 1):
        file_path = directory_path + "/" + file_name
    return file_path


def runner():
    directory_path = input(
        "Enter a directory path containing the files to rename: ")
    recursive = input("Rename recursively? (y or n): ")
    clean_file_names(directory_path, recursive.count("y") >= 1)


runner()
