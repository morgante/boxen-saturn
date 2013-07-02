class projects::tbi {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/tbi":
        ensure => directory
    }
    file { "symlink-tbi-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/tbi/public",
        target  => "/Users/${::luser}/Documents/computer/code/tbi/tbi/businessinsider/htdocs",
    }
    php::project { 'tbi':
        # dotenv        => false,
        # elasticsearch => true,
        mysql         => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php           => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/tbi/tbi",
        source          => 'tbi/tbi'
    }
}