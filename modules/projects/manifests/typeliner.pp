class projects::typeliner {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/typeliner":
        ensure => directory
    }

    file { "symlink-typeliner-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/typeliner/public",
        target     => "/Users/${::luser}/Documents/computer/code/typeliner/cms",
    }

    php::project { 'typeliner':
        # dotenv        => false,
        # elasticsearch => true,
        mysql           => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php             => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/typeliner/cms",
        source          => 'morgante/habari-dev'
    }
}