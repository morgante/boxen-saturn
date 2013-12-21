class projects::habari {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/habari":
        ensure => directory
    }

    file { "symlink-habari-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/habari/public",
        target     => "/Users/${::luser}/Documents/computer/code/habari/dev",
    }

    php::project { 'habari':
        # dotenv        => false,
        # elasticsearch => true,
        mysql           => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php             => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/habari/dev",
        source          => 'morgante/habari-dev'
    }
}