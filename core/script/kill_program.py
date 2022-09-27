from sys import *
import subprocess

out = subprocess.run(["ps", "aux"], stdout=subprocess.PIPE).stdout.decode().split("\n")

pid_to_kill = []
for line in out:
    if str(argv[1]) in line and "python3" not in line:
        #print(line)
        pid_to_kill.append(line.split()[1])

#print(pid_to_kill)

for pid in pid_to_kill:
    subprocess.run(["kill", pid])