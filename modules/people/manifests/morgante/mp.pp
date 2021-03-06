# this file enable development with PHP & MySQL
class people::morgante::mp inherits people::morgante {    
    
    # Install php 5.4
    include php::5_4

    # Install a php version and set as the global default php
    class { 'php::global':
        version => '5.4.10'
    }
    
    # Set up PHP-FPM as a service running a specific version of PHP
    include php::fpm::5_4_10
    
    # Extension
    php::extension::apc { "apc for 5.4.10":
      php     => '5.4.10'
    }
    
    php::extension::mcrypt { "mcrypt for 5.4.10":
      php     => '5.4.10'
    }
    
    php::extension::mongo { "mongo for 5.4.10":
      php     => '5.4.10'
    }

	# Composer
	# curl -sS https://getcomposer.org/installer | php -- --install-dir=bin
	exec {'composer':
	    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir='${boxen::config::home}/bin'"
	}
	
    # php::extension::redis { "redis for 5.4.10":
    #    php     => '5.4.10'
    # }
    
    # Spin up a PHP-FPM pool for a project
    # Ensures:
    #  * the version of PHP is installed
    #  * a PHP-FPM service is configured for this PHP version
    #  * a FPM pool is listening on a per project nginx socket
    # $name = "root"
    # $version = "5.4.10"
    # php::fpm::pool { "root-doc":
      # version     => 5.4.10,
      # socket_path => "${boxen::config::socketdir}/${name}",
      # require     => File["${nginx::config::sitesdir}/${name}.conf"],
    # }
    
    # notify{ "${nginx::config::configfile}": }
    
    # Rewrite nginx
    # public {""}
    
    # # include apache
    # include "apache"
    # 
    # # Apache vhosts with PHP 5.4.11
    # apache::vhost { "root":
    #   port => 80,
    #   # php_version => "5.4.11",
    #   docroot => "/Users/${::luser}/Documents/computer/htdocs",
    # }
    
}