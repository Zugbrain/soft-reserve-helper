#!/bin/sh

# get message bodies from discord input
# remove non-ascii: https://stackoverflow.com/questions/3337936/remove-non-ascii-characters-from-csv
grep -v $'\u2014' discord-thread.txt                            |\
grep -v -E '[nN][aA][mM][eE] - [iI][tT][eE][mM]'                |\
grep '-' | perl -pe 's/[^[:ascii:]]//g' > data/messages.txt

# get player names
cut -d '-' -f 1 data/messages.txt                               |\
sed 's/./\u&/' > data/players.txt

# get item names
cut -d '-' -f 1 --complement data/messages.txt                  |\
sed -e 's/^[ \t]*//' | sed 's/./\u&/' > data/items.txt

# create SR sheet
paste -d "#" data/players.txt data/items.txt                    |\
column -t -s '#' | sort -f                                      |\
sed '1s/^/```\n/' > sr.txt

# create SR sheet - items first
paste -d "#" data/items.txt data/players.txt                    |\
column -t -s '#' | sort -f                                      |\
sed '1s/^/```\n/' > isr.txt

# append ``` to sr.txt & isr.txt so discord interprets it as code
echo '```' >> sr.txt
echo '```' >> isr.txt