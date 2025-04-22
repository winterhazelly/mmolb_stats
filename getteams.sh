echo "" > allteams.txt

curl -s "https://mmolb.com/api/league/6805db0cac48194de3cd3fee" > league.json

teams=($(jq ".Teams" league.json | tr -d '[],"'))

for line in ${teams[@]}
do
    curl -s "https://mmolb.com/api/team/"$line > tteam.json
    emoji="$(jq ".Emoji" tteam.json)"
    loc="$(jq ".Location" tteam.json)"
    name="$(jq ".Name" tteam.json)"
    wins="$(jq '.Record."Regular Season".Wins' tteam.json)"
    losses="$(jq '.Record."Regular Season".Losses' tteam.json)"
    echo $emoji,$loc $name,$wins,$losses >> allteams.txt
done

python3 sortteams.py