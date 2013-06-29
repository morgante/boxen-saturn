class people::morgante {

    notify { 'class people::morgante declared': }
    
    $my_homedir = "/Users/${::luser}"
    
    # Set my git credentials properly
    include git
    git::config::global { 'user.email':
        value  => 'morgante.pell@morgante.net'
    }
    git::config::global { 'user.name' :
        value  => 'Morgante Pell'
    }
    
    # Copy files from eagle (will fail if eagle is not mounted)
    include people::morgante::eagle
    
    ####### Load dotfiles
    # always pull fresh copy from server
    exec { "kill old dotfiles":
        command  => "rm -r ${boxen::config::srcdir}/dotfiles",
        provider => shell
    }
    
    # define dotfile repo
    repository { "${boxen::config::srcdir}/dotfiles":
        source  => 'morgante/dotfiles',
        require => Exec["kill old dotfiles"]
    }
    
    # set osx preferences
    # ---- this part is a hack
    exec { "prepare osx preferences script":
        command  => "chmod 777 ${boxen::config::srcdir}/dotfiles/home/.osx",
        provider => shell,
        require  => Repository["${boxen::config::srcdir}/dotfiles"],
    }
    exec { "set osx preferences":
        command  => "${boxen::config::srcdir}/dotfiles/home/.osx",
        provider => shell,
        user     => root,
        require  => Exec["prepare osx preferences script"],
    }
    
    #### Easy symlinks
    file { "symlink-docs-computer":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/computer",
        target  => "${my_homedir}/Dropbox/computer"
    }
    file { "symlink-docs-education":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/education",
        target  => "${my_homedir}/Dropbox/education"
    }
    file { "symlink-docs-logs":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/logs",
        target  => "${my_homedir}/Dropbox/logs"
    }
    file { "symlink-docs-personal":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/personal",
        target  => "${my_homedir}/Dropbox/personal"
    }
    file { "symlink-docs-reference":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/reference",
        target  => "${my_homedir}/Dropbox/reference"
    }
    file { "symlink-docs-work":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/work",
        target  => "${my_homedir}/Dropbox/work"
    }
    file { "symlink-shelf":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/shelf",
        target  => "${my_homedir}/Dropbox/Shelf"
    }
    
    #### Load Apps
    # -- textmate
    file { "textmate-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/TextMate",
        target  => "${my_homedir}/Dropbox/Applications/TextMate/support"
    }
    include "textmate"
    
    # -- AddressBook
    file { "addressbook-config":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Library/Application Support/AddressBook",
        target  => "${my_homedir}/Dropbox/Applications/AddressBook/support"
    }
    
    # -- Transmission
    include "transmission"

    # Just some apps I like
    include chrome
    include colloquy
    include onepassword
    include onepassword::chrome
    
    # Use zsh!
    include zsh
    
    #     ln -s ~/Dropbox/Applications/Quicksilver/support ~/Library/Application\ Support/Quicksilver
    #     ln -s ~/Dropbox/Applications/Adium/support ~/Library/Application\ Support/Adium\ 2.0
    #     ln -s ~/Dropbox/Applications/Delicious_Library/support ~/Library/Application\ Support/Delicious\ Library\ 2
    #     ln -s ~/Dropbox/Applications/Yojimbo/support ~/Library/Application\ Support/Yojimbo
    #     ln -s ~/Dropbox/security/morgante.keychain ~/Library/Keychains/login.keychain
    #     ln -s ~/Dropbox/work/media/wallpaper ~/Pictures/wallpaper
    #     ln -s ~/Dropbox/Journler ~/Documents/Journler
    #     ln -s ~/Dropbox/Shelf ~/Shelf
    #     ln -s /Applications/Dockables/Dockables "/Applications/ Controls"
    #     ln -s /Applications/Dockables/Dockables/Sleep.app "/Applications/ Sleep.app"
    #     ln -s /Library/WebServer/Documents ~/Web
    #     ln -s ~/Dropbox/computer/video ~/Movies
    #     ln -s ~/Dropbox/Applications/Mail/Preferences/com.apple.mail.plist ~/Library/Preferences/com.apple.mail.plist
    #     ln -s ~/Dropbox/Applications/Mail/accounts ~/Library/Mail
    #     ln -s ~/Dropbox/computer/htdocs ~/Documents/htdocs
    # 
    # 
    #     sudo rm -R ~/Library/Calendars
    #     ln -s ~/Dropbox/Applications/iCal/Calendars ~/Library/Calendars
}
