import os
import sys

args = sys.argv[1:]
path = ""
show_path = False

def putsUsage():
    print("Usage: puts [--path | -p] file_path [--show | -s]")

if len(args) < 1:
    putsUsage()
    input()
    exit()
elif os.path.isfile(args[0]):
    path = args[0]

while len(args) > 0:
    arg = args[0]
    if arg == "--path" or arg == "-p":
        path = args[1]
    elif arg == "--show" or arg == "-s":
        show_path = True
    args.pop(0)

if os.path.isfile(path):
    if show_path:
        print(path + " - " + os.path.abspath(path))
    try:
        with open(path) as f:
            print(f.read())
    except Exception as ex:
        print("Error: " + ex.message)
else:
    putsUsage()
    exit()