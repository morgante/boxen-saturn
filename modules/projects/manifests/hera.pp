class projects::hera {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/hera":
        ensure => directory
    }
    file { "symlink-hera-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/hera/public",
        target     => "/Users/${::luser}/Documents/computer/code/personal/hera",
    }
    php::project { 'hera':
        # dotenv        => false,
        # elasticsearch => true,
        mysql         => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php           => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/personal/hera",
        source          => 'morgante/personal'
    }
}