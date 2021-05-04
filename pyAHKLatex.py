from ahk import AHK
import os


def get_active_window_process_name(ahk):
    return os.path.basename(ahk.active_window.process)


def main():
    ahk = AHK()
    #  onenote needs to be added.
    microsoft_pnames = {"winword.exe", "powerpnt.exe"}
    window_pnames = {"chrome.exe", "firefox.exe", "opera.exe", "msedge.exe",
                            "pycharm64.exe", "whatsapp.exe", "discord.exe"}.union(microsoft_pnames)
    lyx_pname = "lyx.exe"

    enabled = True
    classic_mode = False
    global_mode = False

    installed_keyboards =
    english = "0x409"


if __name__ == "__main__":
    main()
