class people::morgante {

  notify { 'class people::morgante declared': }

  # Set my git credentials properly
  include git
  git::config::global { 'user.email':
	value  => 'morgante.pell@morgante.net'
  }
  git::config::global { 'user.name' :
	value  => 'Morgante Pell'
  }

  # Load dotfiles
  # $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  # repository { $dotfiles_dir:
  #	source => "${::github_user}/dotfiles"
  #}
  

  # Set osx preferences
  exec { "install dotfiles":
  	cwd      => $dotfiles_dir,
  	command  => "./home/.osx",
  	provider => shell,
 	require  => Repository[$dotfiles_dir]
  }

  # Use zsh!
  include zsh

  # Just some apps I like
  include chrome

}
