class projects::heph {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/heph":
        ensure => directory
    }
    file { "symlink-heph-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/heph/public",
        target     => "/Users/${::luser}/Documents/computer/code/morgante/heph",
    }
    php::project { 'heph':
        # dotenv        => false,
        # elasticsearch => true,
        mysql         => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php           => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/morgante/heph",
        source          => 'morgante/personal'
    }
}