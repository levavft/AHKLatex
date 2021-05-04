import ctypes
import keyboard
import winreg
import psutil
import re


def get_active_window_process_name():
    pid = ctypes.wintypes.DWORD()
    user32 = ctypes.WinDLL('user32', use_last_error=True)
    curr_window = user32.GetForegroundWindow()
    user32.GetWindowThreadProcessId(curr_window, ctypes.byref(pid))
    return (psutil.Process(pid.value)).name()


def swap_to_next_language():
    keyboard.send('alt+shift')


def get_current_keyboard_layout():
    user32 = ctypes.WinDLL('user32', use_last_error=True)
    curr_window = user32.GetForegroundWindow()
    thread_id = user32.GetWindowThreadProcessId(curr_window, 0)
    klid = user32.GetKeyboardLayout(thread_id)
    lid = klid & (2 ** 16 - 1)
    return hex(lid)


def get_installed_keyboards():
    access_key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Keyboard Layout\Preload")
    values = {}
    for n in range(0, 20):
        try:
            x = winreg.EnumValue(access_key, n)
            values[hex(int("0x" + x[1], 16))] = int(x[0])
        except:
            break
    winreg.CloseKey(access_key)
    return values


def swap_to_keyboard(keyboard, installed_keyboards):
    current_keyboard = get_current_keyboard_layout()
    assert current_keyboard in installed_keyboards
    assert keyboard in installed_keyboards
    num_of_switches_needed = (installed_keyboards[keyboard] - installed_keyboards[current_keyboard]) % \
                             len(installed_keyboards)
    for _ in range(num_of_switches_needed):
        swap_to_next_language()
    return current_keyboard


def math_mode_functionality(installed_keyboards):
    global previous_language
    english = "0x409"
    if previous_language is None:
        previous_language = swap_to_keyboard(english, installed_keyboards)
    else:
        swap_to_keyboard(previous_language, installed_keyboards)
        previous_language = None


def my_add_word_listener(word, callback, triggers, match_suffix=False, timeout=2):
    state = keyboard._State()
    state.current = ''
    state.time = -1

    def handler(event):
        name = event.name
        if event.event_type == keyboard.KEY_UP or name in keyboard.all_modifiers:
            return

        if timeout and event.time - state.time > timeout:
            state.current = ''
        state.time = event.time

        matched = state.current == word or (triggers is None and state.current + name == word) or\
                  (match_suffix and state.current.endswith(word)) or\
                  (match_suffix and triggers is None and (state.current + name).endswith(word))
        if (triggers is None or name in triggers) and matched:
            callback()
            state.current = ''
        elif len(name) > 1:
            state.current = ''
        else:
            state.current += name

    hooked = keyboard.hook(handler)

    def remove():
        hooked()
        del keyboard._word_listeners[word]
        del keyboard._word_listeners[handler]
        del keyboard._word_listeners[remove]
    keyboard._word_listeners[word] = keyboard._word_listeners[handler] = keyboard._word_listeners[remove] = remove
    # TODO: allow multiple word listeners and removing them correctly.
    return remove


def my_add_abbreviation(source_text, replacement_text,
                        match_suffix=False, omit_ending=True, need_end_char=True, timeout=2):
    """
    modifiers:
    ? - match_suffix = True
    o - omit_ending = True
    c - case sensitive. always on.
    * - need_end_char = False
    o* is not defined.
    """
    del_length_addition = 1 if need_end_char else 0
    ending = "" if omit_ending or not need_end_char else source_text[-1]
    replacement = '\b' * (len(source_text) + del_length_addition) + replacement_text + ending
    callback = lambda: keyboard.write(replacement)
    triggers = ['space', 'enter', 'tab', 'esc'] if need_end_char else None
    return my_add_word_listener(source_text, callback, triggers=triggers, match_suffix=match_suffix, timeout=timeout)


def remove_multiple_abbreviations(handels):
    if handels is not None:
        for handel in handels:
            keyboard.remove_abbreviation(handel)
    return None


def add_multiple_abbreviations(strings):
    return {add_text_hotstring(string) for string in strings}


def format_unicode(string):
    return re.sub(r"{U\+(.*?)}", r"\\u\1", string).encode("utf8").decode("unicode-escape")


def add_text_hotstring(hotstring):
    """
    expected format of the hotstring is AHK's format.
    modifiers:
    ? - match even at the end of a word.
    o - omit the ending character (e.g. the differentiating space).
    c - case sensitive. always on.
    * - no ending character needed.
    """
    assert isinstance(hotstring, str)
    assert hotstring[0] == ":"
    hotstring = hotstring[1:]
    index = hotstring.index(":")
    modifiers = set(hotstring[:index])
    hotstring = hotstring[index+1:]
    index = hotstring.index(":")
    str_to_replace = hotstring[:index]
    replace_with = hotstring[index+2:]
    replace_with = format_unicode(replace_with)
    return my_add_abbreviation(str_to_replace, replace_with,
                               match_suffix=("?" in modifiers), omit_ending=("o" in modifiers),
                               need_end_char=("*" not in modifiers))


def get_hotstrings_from_file(fname):
    hotstrings = set()
    with open(fname, 'r', encoding='utf8') as f:
        for line in f.readlines():
            if len(line) == 0 or line[0] != ":":
                continue
            comment_location = line.find(";")
            if comment_location == -1:
                continue
            hotstrings.add(line[:comment_location].rstrip())
    return hotstrings
