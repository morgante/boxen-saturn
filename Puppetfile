# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "1.13.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.6"
github "nodejs",      "5.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "osx",       	"1.0.0"
github "chrome",    	"1.1.1"
github "zsh",	    	"1.0.0"
github "ohmyzsh",		"1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "colloquy",   	"1.0.0"
github "textmate",   	"1.1.0"
github "onepassword",	"1.0.1"
github "dropbox",	 	"1.1.0"
github "transmission",	"1.0.0"
github "spotify",		"1.0.0"
github "adium",			"1.1.1"
github "quicksilver",	"1.1.0"
github "skype",			"1.0.3"
github "sublime_text_2","1.1.2"
github "kindle",		"1.0.1"
github "slate",			"1.0.0"
github "iterm2",		"1.0.7"
github "superduper",	"1.0.1"

# Development
github "virtualbox",	"1.0.6"
github "eclipse",		"2.2.0"
github "vagrant",		"2.0.7"
github "meteorjs",		"1.0.5", :repo => "newtriks/puppet-meteorjs"
github "heroku",		"2.0.0"
github "mysql",			"1.1.3"
github "mongodb",		"1.0.4", :repo => "modestymaster/puppet-mongodb"
github "wget",			"1.0.0"
github "autoconf",		"1.0.0"
github "libtool",		"1.0.0"
github "pkgconfig",		"1.0.0"
github "pcre",			"1.0.0"
github "apache",		"0.0.2", :repo => "webflo/boxen-puppet-apache"
github "php",			"1.1.2", :repo => "morgante/puppet-php"
github "apache_php",	"0.0.2", :repo => "webflo/puppet-apache_php"
github "java", 			"1.0.5"
github "solr",			"1.0.4"
github "docker",		"1.0.2", :repo => "morgante/puppet-docker"
github "erlang",		"1.0.1"

# StatsD
github "statsd",		"1.0.2"

