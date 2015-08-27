# this file loads in some lovely dotfiles
class people::morgante::dotfiles inherits people::morgante {
    
    notify { "loading dotfiles": }
    
    # define dotfile repo
    repository { "${boxen::config::srcdir}/dotfiles":
        source  => 'morgante/dotfiles'
    }

    # Set up SSH preferences
    file { "ssh-config":
        path    => "/Users/${::luser}/.ssh/config",
        source  => "${boxen::config::srcdir}/dotfiles/home/.ssh",
        require  => Repository["${boxen::config::srcdir}/dotfiles"],
    }

    # set osx preferences
    # ---- this part is a hack
    exec { "prepare-osx-preferences":
        command  => "chmod 777 ${boxen::config::srcdir}/dotfiles/home/.osx",
        provider => shell,
        require  => Repository["${boxen::config::srcdir}/dotfiles"],
        before   => Exec["set-osx-preferences"]
    }
    exec { "set-osx-preferences":
        command  => "${boxen::config::srcdir}/dotfiles/home/.osx",
        creates  => "${my_homedir}/.osx",
        provider => shell,
        user     => root
    }
    
    # set up tunnel script
    file { "tunnel-start-copy":
        path    => "/Users/${::luser}/.tunnel-start",
        source  => "${boxen::config::srcdir}/dotfiles/home/.tunnel-start",
        require  => Repository["${boxen::config::srcdir}/dotfiles"],
    }
    exec { "tunnel-autostart":
        command  => "defaults write com.apple.loginwindow LoginHook /Users/${::luser}/.tunnel-start",
        provider => shell,
        user     => root,
        require  => File["tunnel-start-copy"]
    }

    # comment this out to auto-enable proxy
    # exec { "tunnel-proxy":
    #    command  => "networksetup -setsocksfirewallproxy Wi-Fi localhost 8089 Off",
    #    provider => shell,
    #    user     => root,
    #    require  => Exec["tunnel-autostart"]
    #}
    
}