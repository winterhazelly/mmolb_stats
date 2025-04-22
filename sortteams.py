with open("allteams.txt") as file:
    teams=file.readlines()

teams = [t.replace('"','').replace("\n",'') for t in teams[1:]]
teamlists = [t.split(",") for t in teams]
wlr = []

for t in teamlists:

    try:
        wlr.append(float(t[2])/float(t[3]))
    except:
        wlr.append(0)
    
sortind = sorted(enumerate(wlr), key=lambda v: v[-1],reverse=True)
teamsort = [teamlists[i] for i,_ in sortind]

with open("allteamssorted.txt","w") as file:
    for team in teamsort:
        file.write(f"{team[0]} {team[1]} {team[2]}-{team[3]}\n")