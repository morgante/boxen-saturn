# this file loads in some lovely applications
class people::morgante::applications inherits people::morgante {
    
    notify { "loading applications": }

    # -- Dropbox
    include "dropbox"
    $my_dropbox = "${my_homedir}/Dropbox"
    
    notify{ "dropbox: ${my_dropbox}": }

    # -- Super Duper
    include "superduper"

    # -- iTerm
    include iterm2::stable
    
    # -- textmate
    file { "textmate-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/TextMate",
        target  => "${my_homedir}/Dropbox/Applications/TextMate/support"
    }
    include "textmate"
    exec { "use-textmate-git":
        command => "git config --global core.editor \"mate -w\""
    }

	# --- Eclipse
	include eclipse::java
    
    # -- AddressBook
    # file { "addressbook-config":
    #         ensure  => link,
    #         mode    => '0644',
    #         force   => true,
    #         path    => "${my_homedir}/Library/Application Support/AddressBook",
    #         target  => "${my_homedir}/Dropbox/Applications/AddressBook/support"
    #     }
    
    # -- Mail.app
    file { "${my_homedir}/Library/Mail":
        ensure  => directory,
    }

	file { "${my_homedir}/Library/Mail/V2":
        ensure  => directory,
    }

    file { "mail-pref":
        ensure  => link,
        mode    => '0644',
        force   => true,
        path    => "${my_homedir}/Library/Preferences/com.apple.mail.plist",
        target  => "${my_dropbox}/Applications/Mail/Preferences/com.apple.mail.plist"
    }
  
    file { "mail-data":
        recurse	=> true,
		replace	=> false,
        path    => "${my_homedir}/Library/Mail/V2/MailData",
        source  => "${my_dropbox}/Applications/Mail/data"
    }

	# -- Sublime Text
	include sublime_text_2
	file { "sublime-config":
        ensure  => link,
		force	=> true,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/Sublime Text 2",
        target  => "${my_dropbox}/Applications/sublime/support"
    }
        
    # -- Adium
    file { "adium-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/Adium 2.0",
        target  => "${my_homedir}/Dropbox/Applications/Adium/support"
    }
    include "adium"
    
    # -- VLC
    package { 'VLC':
        ensure => installed,
        source => 'http://get.videolan.org/vlc/2.0.7/macosx/vlc-2.0.7.dmg',
        provider => appdmg,
    }
    
    # -- QuickSilver
    file { "quicksilver-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/Quicksilver",
        target  => "${my_homedir}/Dropbox/Applications/Quicksilver/support"
    }
	package { 'quicksilver':
		ensure   => installed,
		source   => 'http://cdn.qsapp.com/com.blacktree.Quicksilver__16390.dmg',
		provider => appdmg,
	}
    file { "quicksilver-link":
		ensure  => link,
		mode    => '0644',
		path    => "${my_homedir}/shelf/Quicksilver",
		target  => "/Applications/Quicksilver.app"
	}
    
    # -- Activity Monitor
    file { "activity-monitor-link":
        ensure  => link,
		force	=> true,
        mode    => '0644',
        path    => "${my_homedir}/Shelf/Activity Monitor",
        target  => "/Applications/Utilities/Activity Monitor.app"
    }
    
    # -- Yojimbo
    file { "yojimbo-config":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Application Support/Yojimbo",
        target  => "${my_homedir}/Dropbox/Applications/Yojimbo/support"
    }
    package { 'yojimbo':
        ensure => installed,
        source => 'http://pine.barebones.com/files/yojimbo-304.dmg',
        provider => appdmg,
    }
    
    # -- Transmission
    include "transmission"
    
    # --- Chrome
    include chrome
    
    # -- 1password
    include onepassword
    include onepassword::chrome
    
    # -- Spotify
    include "spotify"

    # -- Colloquy
    include colloquy
    
    # -- Skype
    include "skype"

	# -- Kindle
	include "kindle"
    
}