# this file loads in some lovely dotfiles
class people::morgante::dotfiles inherits people::morgante {
    
    notify { "loading dotfiles": }
    
    # define dotfile repo
    repository { "${boxen::config::srcdir}/dotfiles":
        source  => 'morgante/dotfiles'
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
    
}