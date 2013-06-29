# this file simple copies stuff over from the eagle backup
class people::morgante::eagle {
    
    # notify { 'copying certain files from eagle': }
    
    $eagle_dir = "/Volumes/eagle"
    $my_eagle = "${eagle_dir}/Users/morgantepell"
    
    exec { "check-eagle":
        command => "ls ${my_eagle}",
        onlyif => "test -f ${my_eagle}"
    }
    
    # file { "symlink-my-eagle":
    #     ensure  => link,
    #     mode    => '0644',
    #     path    => "${boxen::config::srcdir}/my_eagle",
    #     target  => "${my_eagle}"
    # }
    
    # copy over .ssh file
    file { "ssh-keys":
        ensure  => "directory",
        recurse => true,
        path    => "/Users/${::luser}/.ssh",
        target  => "${my_eagle}/.ssh",
        require => Exec["check-eagle"]
    }
    
    # include 

}