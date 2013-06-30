# this file loads in some lovely applications
class people::morgante::applications inherits people::morgante {
    
    notify { "loading applications": }
    
    # -- textmate
    file { "textmate-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/TextMate",
        target  => "${my_homedir}/Dropbox/Applications/TextMate/support"
    }
    include "textmate"
    exec { "use-textmate-git":
        command => "git config --global core.editor \"mate -w\""
    }
    
    # -- AddressBook
    file { "addressbook-config":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Library/Application Support/AddressBook",
        target  => "${my_homedir}/Dropbox/Applications/AddressBook/support"
    }
    
    # -- Mail.app
    file { "mail-pref":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Library/Preferences/com.apple.mail.plist",
        target  => "${my_homedir}/Dropbox/Applications/Mail/Preferences/com.apple.mail.plist"
    }
   
    file { "mail-data":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Library/Mail",
        target  => "${my_homedir}/Dropbox/Applications/Mail/accounts"
    }
    
    # -- Calendar    
    file { "calendar-config":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Calendars",
        target  => "${my_homedir}/Dropbox/Applications/iCal/Calendars"
    }
    
    #     ln -s ~/Dropbox/Applications/Quicksilver/support ~/Library/Application\ Support/Quicksilver
    
    
    # -- Transmission
    include "transmission"
    
    # --- Chrome
    include chrome
    
    # -- 1password
    include onepassword
    include onepassword::chrome
    
    # -- Spotify
    include "spotify"

    # -- Colloquy
    include colloquy
    
}