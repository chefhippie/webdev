name "webdev"
maintainer "Thomas Boerger"
maintainer_email "tboerger@tbpro.de"
license "Apache 2.0"
description "Installs/Configures webdev"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "0.0.1"
depends "nginx"
depends "php"
depends "ruby"
depends "mysql"
depends "postgresql"
depends "mongodb"
depends "memcached"
depends "elasticsearch"
depends "redis"
recipe "webdev", "Installs/Configures webdev"

supports "suse", ">= 12.3"
supports "debian", ">= 7.0"
supports "ubuntu", ">= 12.04"
