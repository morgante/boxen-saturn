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
    
    # Load applications
    include people::morgante::applications
    
    # Load applications
    include people::morgante::dotfiles
    
    #### Easy symlinks
    include people::morgante::symlinks
    
    ### ZSH
    include "zsh"
    include "ohmyzsh"
    file { "zsh-profile":
        path    => "/Users/${::luser}/.zprofile",
        source  => "${boxen::config::srcdir}/dotfiles/home/.zprofile",
        require  => Repository["${boxen::config::srcdir}/dotfiles"]
    }
    file { "zsh-rc":
        path    => "/Users/${::luser}/.zshrc",
        source  => "${boxen::config::srcdir}/dotfiles/home/.zshrc",
        require  => Repository["${boxen::config::srcdir}/dotfiles"]
    }
    
    #     ln -s ~/Dropbox/Applications/Quicksilver/support ~/Library/Application\ Support/Quicksilver
    #     ln -s ~/Dropbox/Applications/Adium/support ~/Library/Application\ Support/Adium\ 2.0
    #     ln -s ~/Dropbox/Applications/Delicious_Library/support ~/Library/Application\ Support/Delicious\ Library\ 2
    #     ln -s ~/Dropbox/Applications/Yojimbo/support ~/Library/Application\ Support/Yojimbo
    #     ln -s ~/Dropbox/work/media/wallpaper ~/Pictures/wallpaper
    #     ln -s ~/Dropbox/Journler ~/Documents/Journler
    #     ln -s ~/Dropbox/Shelf ~/Shelf
    #     ln -s /Applications/Dockables/Dockables "/Applications/ Controls"
    #     ln -s /Applications/Dockables/Dockables/Sleep.app "/Applications/ Sleep.app"
    #     ln -s /Library/WebServer/Documents ~/Web
    #     ln -s ~/Dropbox/computer/video ~/Movies
    #     ln -s ~/Dropbox/computer/htdocs ~/Documents/htdocs
    # 
    # 
    #     sudo rm -R ~/Library/Calendars
    #     ln -s ~/Dropbox/Applications/iCal/Calendars ~/Library/Calendars
}
