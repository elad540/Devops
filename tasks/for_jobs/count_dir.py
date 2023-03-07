import os
dir_name = input('enter full path of directory to count in? (default is current directory) ') or os.getcwd()
count_dir = len(next(os.walk(dir_name))[1])
if count_dir <= 10:
    print(f"0 {count_dir}")
else:
    print(f"1 {count_dir}")
