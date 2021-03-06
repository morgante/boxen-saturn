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

    # Set preferences
    include people::morgante::preferences
    
    #### Easy symlinks
    include people::morgante::symlinks
    
    # PHP Development
    include people::morgante::mp
    
    # StatsD/analytics testing
    include people::morgante::analytics
    
    # Foreman
    include foreman

    # Java
    include java
    
    # Node.js
    class { 'nodejs::global': version => 'v0.10.5' }
    
    # Meteor
    include meteorjs
    
    # Vagrant
    include vagrant

	# VirtualBox
	include virtualbox
    
    # Mongo
    # include mongodb
    # include mongodb::config
    
    # MySQL
    include "mysql"
    
    # Heroku
    include "heroku"

    # Docker
    include docker
    
    # Projects
    include projects::all
    
    ### ZSH
    include people::morgante::zsh

    # Slate
    include "slate"
    file { "slate-profile":
        path    => "/Users/${::luser}/.slate",
        source  => "${boxen::config::srcdir}/dotfiles/home/.slate",
        require  => Repository["${boxen::config::srcdir}/dotfiles"]
    }

    # ssh copy ids
    package { 'ssh-copy-id':
        ensure => installed,
    }
}
