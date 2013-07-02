class projects::mastermade {
    
    # boxen::config::htdir = 
    file { "${boxen::config::srcdir}/mastermade":
        ensure => directory
    }
    file { "symlink-mastermade-public":
        ensure  => link,
        mode    => '0644',
        path    => "${boxen::config::srcdir}/mastermade/public",
        target     => "/Users/${::luser}/Documents/computer/code/mastermade/mastermade",
    }
    php::project { 'mastermade':
        # dotenv        => false,
        # elasticsearch => true,
        # mysql         => true,
        nginx           => true,
        # redis         => true,
        # ruby          => '1.9.3',
        php           => '5.4.10',
        dir             => "/Users/${::luser}/Documents/computer/code/mastermade/mastermade",
        source          => 'mastermade/mastermade'
    }
}