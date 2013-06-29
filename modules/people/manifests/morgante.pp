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

	####### Load dotfiles
	# always pull fresh copy from server
	#exec { "kill old dotfiles":
	#	command	 => "rm -r ${boxen::config::srcdir}/dotfiles",
	#	provider => shell
	#}
	
	# define dotfile repo
	repository { "${boxen::config::srcdir}/dotfiles":
		source => 'morgante/dotfiles',
		# require => Exec["kill old dotfiles"]
	}
	
	# set osx preferences
	# ---- this part is a hack
	exec { "prepare osx preferences script":
		command	 => "chmod 777 ${boxen::config::srcdir}/dotfiles/home/.osx",
		provider => shell,
		require  => Repository["${boxen::config::srcdir}/dotfiles"],
	}
	exec { "set osx preferences":
		command	 => "${boxen::config::srcdir}/dotfiles/home/.osx",
		provider => shell,
		user => root,
		require  => Exec["prepare osx preferences script"],
	}
	
	# Use zsh!
	include zsh

	# Just some apps I like
	include chrome
	include colloquy
	include textmate

}
