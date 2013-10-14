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
    
    # PHP Development
    include people::morgante::mp
    
    # StatsD/analytics testing
    include people::morgante::analytics
    
    # Foreman
    include foreman
    
    # Node.js
    class { 'nodejs::global': version => 'v0.10.5' }
    
    # Meteor
    include meteorjs
    
    # Vagrant
    include vagrant

	# VirtualBox
	include virtualbox
    
    # Mongo
    include mongodb
    include mongodb::config
    
    # MySQL
    include "mysql"
    
    # Heroku
    include "heroku"
    
    # Projects
    include projects::all
    
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
    
}
