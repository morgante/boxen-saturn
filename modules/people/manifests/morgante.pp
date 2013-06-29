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
	repository { "${boxen::config::srcdir}/dotfiles":
	    source => 'morgante/dotfiles',
	  }

	# file { "${my_homedir}/.osx":
	# 	ensure  => link,
	# 	mode    => '0644',
	# 	target  => "${my_sourcedir}/dotfiles/home/.osx",
	# 	require => Repository["${boxen::config::srcdir}/dotfiles"],
	# }
	
	exec { "set osx preferences":
		command	 => "${boxen::config::srcdir}/dotfiles/home/.osx",
		provider => shell,
		require  => Repository["${boxen::config::srcdir}/dotfiles"],
	}
	
	# exec { "cp -r ${dotfiles}/fonts/SourceCodePro ${home}/Library/Fonts/SourceCodePro":
	#     creates => "${home}/Library/Fonts/SourceCodePro",
	#     require => Repository[${my_sourcedir}/dotfiles]
	#   }

	# Use zsh!
	include zsh

	# Just some apps I like
	include chrome
	include colloquy
	include textmate

}
