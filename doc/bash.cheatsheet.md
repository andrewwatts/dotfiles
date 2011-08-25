
CLI Navigation
---------------
^a - move to start of line
^e - move to end of line

^b - move backward a character
^f - move forward a character

^k - delete to end of line
^w - delete backward a word
^u - delete from front of line
^d - delete under cursor

^r - search history
^R - searhc history with multi occurrence

^x^e - edit line in $EDITOR
fc - edit last command in $EDITOR

^xx - move between front of line and current position


CLI Substitution
-----------------

!$ - last word of previous command

!!:s,a,b, - replace first occurance of a with b
!!:sg,a,b, - replace all occurances of a with b



String Functions
-----------------

${string#substring} - remove from sring to substring
${string%substring} - remove from right side of string to substring
${string/substring/replacement} - substitute first match of substring with replacement
${string//substring/replacement} - substitude all matches of substring with replacement

