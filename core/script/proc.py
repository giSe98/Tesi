import pandas as pd
from subprocess import Popen, PIPE
from time import sleep, time, strftime, localtime

df = pd.DataFrame([], columns=['USER', 'PID', '%CPU', '%MEM', 'VSZ', 'RSS', 'TTY', 'STAT', 'START', 'TIME', 'ENDED', 'COMMAND'])

processes = Popen(['ps', 'aux'], stdout=PIPE).communicate()[0].decode().strip().split('\n')
nfields = len(processes[0].split()) - 1

for row in processes[1:]:
    splitted = row.split(None, nfields)
    if len(splitted) < 11:
        splitted.append("")
    splitted[1] = int(splitted[1])
    splitted.insert(10, "")
    new_row = pd.DataFrame([splitted], columns=['USER', 'PID', '%CPU', '%MEM', 'VSZ', 'RSS', 'TTY', 'STAT', 'START', 'TIME', 'ENDED', 'COMMAND'])
    df = pd.concat([df, new_row], ignore_index = True, axis = 0)

df.to_csv("results/outPROC.csv", index=False, columns=['USER', 'PID', '%CPU', '%MEM', 'VSZ', 'RSS', 'TTY', 'STAT', 'START', 'TIME', 'ENDED', 'COMMAND'])
sleep(5)

pids = df['PID'].tolist()
while True:
    processes = Popen(['ps', 'aux'], stdout=PIPE).communicate()[0].decode().strip().split('\n')
    new_proc = {}
    for row in processes[1:]:
        splitted = row.split(None, nfields)
        if len(splitted) < 11:
            splitted.append("")
        splitted[1] = int(splitted[1])
        splitted.insert(10, "")
        new_proc[splitted[1]] = splitted

    keys = list(new_proc.keys())
    to_update = list(set(pids) & set(keys))
    new_pids = [x for x in keys if x not in pids]
    ended_pids = [x for x in pids if x not in keys]

    pids = to_update + new_pids

    for pid in to_update:
        index = df.index[df['PID'] == pid][0]
        df.loc[index] = new_proc[pid]

    if new_pids:
        for pid in new_pids:
            new_row = pd.DataFrame([new_proc[pid]], columns=['USER', 'PID', '%CPU', '%MEM', 'VSZ', 'RSS', 'TTY', 'STAT', 'START', 'TIME', 'ENDED', 'COMMAND'])
            df = pd.concat([df, new_row], ignore_index = True, axis = 0)

    if ended_pids:
        for pid in ended_pids:
            index = df.index[df['PID'] == pid][0]
            df.loc[index, ['ENDED']] = strftime("%H:%M:%S", localtime(time() - 2.0))
    
    df.to_csv("results/outPROC.csv", index=False, columns=['USER', 'PID', '%CPU', '%MEM', 'VSZ', 'RSS', 'TTY', 'STAT', 'START', 'TIME', 'ENDED', 'COMMAND'])
    sleep(2)