class projects::webgrind {
    
    file { "${boxen::config::srcdir}/webgrind":
        ensure => directory
    }
    file { "symlink-webgrind-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/webgrind/public",
        target     => "/Users/${::luser}/Documents/computer/code/webgrind",
    }
    php::project { 'webgrind':
        # dotenv        => false,
        # elasticsearch => true,
        mysql         => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php           => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/webgrind",
        source          => 'jokkedk/webgrind'
    }

}