# AHKLatex
An AHK script that converts common latex commands to their equivalent Unicode.

This script is made with lyx users in mind. If you're a lyx user and encounter unexpected behaviour, please create an issue.

Running the script:
To be able to run AHKLatex.ahk, you need to install autohotkey v1.1
link - https://autohotkey.com/download/
Afterwards, just double click the script to run it.

Stopping the script:
The script should appear in your app tray (next to the volume, date, internet etc.). 
Right clicking on the script will give you the option to suspend hotkeys / pause the script / exit the script.

Running the script on startup:
Find the script file, select it, and press Ctrl+C.
Press Win+R to open the Run dialog, then enter shell:startup and click OK or Enter. This will open the Startup folder for the current user. To instead open the folder for all users, enter shell:common startup (however, in that case you must be an administrator to proceed).
Right click inside the window, and click "Paste Shortcut". The shortcut to the script should now be in the Startup folder.

Usage:
Most commonly used lyx shortcuts work, as long as they exist in unicode & don't require combining characters (with a few exceptions).
Examples:
1. \frac won't work as it requires combining two sets of characters.
2. \in \notin will work just fine, as they are simple unicode characters.
   e.g \in ↦ ∈ and \notin ↦ ∉.
3. ^ and _ won't work with any characters, but unicode does support digits, +-, and a few letters. Most of these will work.
   e.g. X^i ↦ Xⁱ.
   
If you tried to use a common lyx/ latex shortcut that didn't work, feel free to request it. I'll add it if it's possible.

Meta shortcuts:
There are a few shortcuts that change the behaviour of other shortcuts.
F6 disables/ enables all other non-meta shortcuts. It defaults to the enabled state.
F7 disables/ enables global_mode, i.e. instead of only supporting shortcuts in a few applications it supports those shortcuts everywhere. Use with caution (hence, defaults to disabled).
F8 disables/ enables classic_mode. This simply adds more shortcuts, that may not be intuitive to lyx users.
F9 print current meta-state.

List of applications where this script works when global_mode is off:
chrome, firefox, opera, microsoft edge, pycharm, whatsapp (the desktop version), discord.

Feel free to request other applications. I will add them if they are popular & if there is no obvious clash with intended use of the app.

Editing the script:
It is recommended to edit this file with Pycharm/AHK's native editor. Other editors might not support some of the unicode here, and have not been tested.

For more mathematical symbols that you might want to add visit the following:
http://elyxer.nongnu.org/lyx/Math.html
https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode
https://en.wikipedia.org/wiki/List_of_mathematical_symbols_by_subject

For superscripts and subscripts visit:
https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts

For other combining characters visit:
https://en.wikipedia.org/wiki/Combining_character

Feel free to share your improvements as issues! I will gladly take a look.
