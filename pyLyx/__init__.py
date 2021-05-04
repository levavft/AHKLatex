from pyLyx.pyLyx import *

"""
TODO: (s)
1. implement window checking 
(should I register and remove all hotstrings every time? should I put the window check in every hotstring?)
2. improve math mode
3. implement global mode
4. implement print_global_status
5. find a way to add onenote
6. implement \ש in classic mode
"""
#  onenote needs to be added.
microsoft_pnames = {"winword.exe", "powerpnt.exe"}
window_pnames = {"chrome.exe", "firefox.exe", "opera.exe", "msedge.exe",
                 "pycharm64.exe", "whatsapp.exe", "discord.exe"}.union(microsoft_pnames)
lyx_pname = "lyx.exe"

global_hostring_path = "CommonHotStrings.txt"
classic_hotstring_path = "ClassicHotStrings.txt"

enabled = True
global_mode = False
classic_mode = False
common_hotstring_strings = get_hotstrings_from_file(global_hostring_path)
classic_hotstring_strings = get_hotstrings_from_file(classic_hotstring_path)
common_hotstring_handels = add_multiple_abbreviations(common_hotstring_strings)
classic_hotstring_handels = None

previous_language = None


def swap_enabled():
    global enabled
    global global_mode
    global classic_mode
    global common_hotstring_strings
    global classic_hotstring_strings
    global common_hotstring_handels
    global classic_hotstring_handels
    if enabled:
        enabled = False
        common_hotstring_handels = remove_multiple_abbreviations(common_hotstring_handels)
        classic_hotstring_handels = remove_multiple_abbreviations(classic_hotstring_handels)
    else:
        enabled = True
        common_hotstring_handels = add_multiple_abbreviations(common_hotstring_strings)
        if classic_mode:
            classic_hotstring_handels = add_multiple_abbreviations(classic_hotstring_strings)


def swap_global_mode():
    raise NotImplemented()


def swap_classic_mode():
    global enabled
    global global_mode
    global classic_mode
    global common_hotstring_strings
    global classic_hotstring_strings
    global common_hotstring_handels
    global classic_hotstring_handels
    if not enabled:
        classic_mode = not classic_mode
    else:
        if classic_mode:
            classic_mode = False
            classic_hotstring_handels = remove_multiple_abbreviations(classic_hotstring_handels)
        else:
            classic_mode = True
            classic_hotstring_handels = add_multiple_abbreviations(classic_hotstring_strings)


def print_global_status():
    raise NotImplemented()


def main():
    installed_keyboards = get_installed_keyboards()

    keyboard.add_hotkey("F6", swap_enabled)
    keyboard.add_hotkey("F7", swap_global_mode)
    keyboard.add_hotkey("F8", swap_classic_mode)
    keyboard.add_hotkey("F9", print_global_status)
    # since the function "ctrl_m_functionality" eventually sends a hotkey, ctrl+m has to be suppressed.
    keyboard.add_hotkey("ctrl+m", math_mode_functionality, (installed_keyboards,), suppress=True)

    keyboard.wait("esc")


if __name__ == "__main__":
    main()
