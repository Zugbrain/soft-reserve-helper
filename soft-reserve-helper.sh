#!/bin/sh

# get message bodies from discord input
grep -v $'\u2014' discord-thread.txt                |\
grep -v -E '[nN][aA][mM][eE] - [iI][tT][eE][mM]'    |\
grep '-' > data/messages.txt

# get player names
cut -d '-' -f 1 data/messages.txt > data/players.txt

# get item names
cut -d '-' -f 1 --complement data/messages.txt      |\
sed -e 's/^[ \t]*//' > data/items.txt

# create SR sheet
paste -d "#" data/players.txt data/items.txt        |\
column -t -s '#' | sort -f                          |\
sed 's/./\u&/' | sed '1s/^/```\n/' > sr.txt

# append ``` to sr.txt so discord interprets it as code
echo '```' >> sr.txt
