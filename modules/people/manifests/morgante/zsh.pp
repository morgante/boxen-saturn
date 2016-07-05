# this file loads in some lovely dotfiles
class people::morgante::zsh inherits people::morgante {
    
    notify { "loading ohmyzsh": }
    
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

}
