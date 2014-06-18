# Our Boxen

1. Set [name](http://en.wikipedia.org/wiki/Moons_of_Saturn#Tables_of_moons) to a moon of Saturn.

    ```
    MOON="moon"
    scutil --set ComputerName "$MOON"
    scutil --set HostName "$MOON.local"
    scutil --set LocalHostName "$MOON.local"
    defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MOON"
    ```

2. Enable full disk encryption.
2. Install XCode
3. Install XCode command line tools
4. Generate an [SSH key](https://help.github.com/articles/generating-ssh-keys) with a passphrase.

    ```
    cd ~/.ssh
    ssh-keygen -t rsa -C "morgante.pell@morgante.net"
    ssh-add id_rsa
    pbcopy < ~/.ssh/id_rsa.pub
    ```

5. Add the key (it's on your clipboard) to your [GitHub](https://github.com/settings/ssh).
6. Run Boxen

    ```
    sudo mkdir -p /opt/boxen
    sudo chown ${USER}:staff /opt/boxen
    git clone git@github.com:morgante/boxen-saturn.git /opt/boxen/repo
    cd /opt/boxen/repo
    bundle install
    script/boxen
    ```
7. Open Mission Control and add a bunch of spaces.
