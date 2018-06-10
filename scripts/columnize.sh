# Used in vim to columnize selected text using a single space between the longest columns.  Also 
# will note the indent level and apply it to the columnized text.

stdin=$(cat -)
firstline=$(echo "$stdin" | head -1)
indent=$(echo "$firstline" | grep -o '^ *')
echo "$stdin" | column -t | sed "s/ \([^ ]\)/\1/g" | sed "s/^/$indent/"
