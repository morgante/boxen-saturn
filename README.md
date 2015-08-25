# Our Boxen

1. Set [name](http://en.wikipedia.org/wiki/Moons_of_Saturn#Tables_of_moons) to a moon of Saturn.

    ```
    MOON="moon"
    scutil --set ComputerName "$MOON"
    scutil --set HostName "$MOON"
    scutil --set LocalHostName "$MOON"
    defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MOON"
    ```

2. Enable full disk encryption.
2. Install XCode
3. Install XCode command line tools
4. Run Boxen

    ```
    sudo mkdir -p /opt/boxen
    sudo chown ${USER}:staff /opt/boxen
    git clone https://github.com/morgante/boxen-saturn.git /opt/boxen/repo
    cd /opt/boxen/repo
    bundle install
    script/boxen
    ```
5. Open Mission Control and add a bunch of spaces.
