create an alias for to the current working directory (helps when you are jumping around a few directories that are far away from each other in the tree):

echo "alias myalias=\"cd $PWD\"" >> ~/.bashrc ; source ~/.bashrc

batch rename a string substitution or extension within a directory (this renames all files containing 'raw' in the name to 'gld', i.e. S18_voicetap.raw becomes S18_voicetap.gld)

rename 's/raw/gld' *

cd to a directory that contains the .spec file extension:

cd `find . | grep "\.spec$" | tail -n 1 | xargs dirname`

view the first file in a directory:

ls | head -n 1 | xargs less

get 2nd line from output:

ls | sed -n '2p'| xargs less

find commands in history that start with dd:

history | # command history
awk '{$1=""; print $0}' | # print every column after the first (the number references)
sed 's/^ //g' | # remove leading whitespace at beginning of line
grep "^dd" | # match lines that start with dd (utility for removing or copying bytes from binary files (and so much more!)

extract first ten bytes:

head -c 10 (file.tap)

mercilessly kill whatever process is running in the foreground (works great for Python automation code when ctrl+c isn't really doing the trick!

ctrl+shift+\

will bring up recently issued commands. you can type !(history number) to execute a command you issued (without having to use the up arrow or remember)

history 

find a file in a subdirectory (useful if you don't remember the structure)

find . | grep "deviceproperties"

find text strings within files, returns list of files and where the text string occurred (useful if you're looking for a function and not a file)

grep -r "mplayer"

copy and rename file extensions, this one copies and renames .raw to .gld

for file in *.raw ; do cp "$file" "${file/raw/gld}"; done

SSH into a server but allow X to remotely display for commands like feh (image viewer) on the client via -Y option (you may need to configure your server to allow remote display):

ssh -Y user@server
