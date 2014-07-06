Launcher Setup:
  cmd.run:
    - name: dbus-launch --exit-with-session gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://remmina.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
    - user: vagrant