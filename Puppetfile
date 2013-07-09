# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.1.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "gcc",        "1.0.0"
github "git",        "1.2.2"
github "homebrew",   "1.1.2"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
github "nginx",      "1.4.0"
github "nodejs",     "2.2.0"
github "repository", "2.0.2"
github "ruby",       "4.1.0"
github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"

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
github "quicksilver",	"1.0.1"
github "skype",			"1.0.3"

# Development
github "vagrant",		"2.0.7"
github "meteorjs",		"1.0.5", :repo => "newtriks/puppet-meteorjs"
github "heroku",		"2.0.0"
github "mysql",			"1.1.3"
github "mongodb",		"1.0.4", :repo => "modestymaster/puppet-mongodb"
github "foreman",		"1.0.0"
github "wget",			"1.0.0"
github "autoconf",		"1.0.0"
github "libtool",		"1.0.0"
github "pkgconfig",		"1.0.0"
github "pcre",			"1.0.0"
github "apache",		"0.0.2", :repo => "webflo/boxen-puppet-apache"
github "php",			"1.1.1", :repo => "morgante/puppet-php"
github "apache_php",	"0.0.2", :repo => "webflo/puppet-apache_php"