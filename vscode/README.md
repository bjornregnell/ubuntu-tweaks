# install vs code as deb package
```
sudo apt install apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stab>
sudo apt install code
```

# fix keyboard shortcut clash in markdown 

After installing Markdown All In One there is a clash with the keyboard shortcut for multiline editing.

1. *This is not needed if you sync your user settings  in vscode, but otherwise:* Change shortcut in user `keybindings.json`:
```json
// Place your key bindings in this file to override the defaults
[
  {
    "key": "ctrl+shift+alt+down",
    "command": "markdown.extension.onCopyLineDown",
    "when": "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+shift+alt+up",
    "command": "markdown.extension.onCopyLineUp",
    "when": "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'"
  },
  {
    "key": "shift+alt+down",
    "command": "-markdown.extension.onCopyLineDown",
    "when": "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'"
  },
  {
    "key": "shift+alt+up",
    "command": "-markdown.extension.onCopyLineUp",
    "when": "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId == 'markdown'"
  }
]
```


2. Remove Ubuntu shortcut `ctrl+shift+alt+up` and `ctrl+shift+alt+down` and use super+pagedown and super+pageup instead:

https://askubuntu.com/questions/1099107/18-04-change-shortcut-for-switching-workspace

Do this with graphical ui after installing and then open dconf-editor and navigate to `org/gnome/desktop/wm/keybindings`:
```
sudo apt install dconf-editor
```

Or in terminal:
```
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"
```
