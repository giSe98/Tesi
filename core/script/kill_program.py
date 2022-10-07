from sys import *
import subprocess

ps = subprocess.run(['ps', 'aux'], check=True, capture_output=True)
out = subprocess.run(['grep', argv[1]], input=ps.stdout, capture_output=True).stdout.decode('utf-8').strip().split("\n")

pid_to_kill = []
for line in out:
    if argv[0] not in line:
        pid_to_kill.append(line.split()[1])

print(pid_to_kill)

if pid_to_kill:
    for pid in pid_to_kill:
        subprocess.run(["kill", pid])