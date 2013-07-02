# this file loads in some lovely symlinks
class people::morgante::symlinks inherits people::morgante {
    
    notify { "setting up symlinks": }
    
    file { "symlink-docs-computer":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/computer",
        target  => "${my_homedir}/Dropbox/computer"
    }
    file { "symlink-docs-education":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/education",
        target  => "${my_homedir}/Dropbox/education"
    }
    file { "symlink-docs-logs":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/logs",
        target  => "${my_homedir}/Dropbox/logs"
    }
    file { "symlink-docs-personal":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/personal",
        target  => "${my_homedir}/Dropbox/personal"
    }
    file { "symlink-docs-reference":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/reference",
        target  => "${my_homedir}/Dropbox/reference"
    }
    file { "symlink-docs-work":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Documents/work",
        target  => "${my_homedir}/Dropbox/work"
    }
    
    # shelf
    file { "symlink-shelf":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/shelf",
        target  => "${my_homedir}/Dropbox/Shelf"
    }
    
    # wallpaper
    file { "symlink-wallpaper":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Pictures/wallpaper",
        target  => "${my_homedir}/Dropbox/Apps/Desktoppr"
    }
    
    # video
    file { "symlink-video":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Movies/video",
        target  => "${my_homedir}/Dropbox/computer/video"
    }      
    
    # keychain
    file { "symlink-keychain":
        ensure  => link,
        mode    => '0644',
        path    => "${my_homedir}/Library/Keychains/login.keychain",
        target  => "${my_homedir}/Dropbox/security/morgante.keychain"
    }
    
    # config
    file { "symlink-config":
        ensure  => link,
        mode    => '0644',
        path    => "/config",
        target  => "${my_homedir}/Dropbox/computer/config"
    }
    
}