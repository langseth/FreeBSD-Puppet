require 'puppet/provider/parsedfile'

tty_file = '/etc/ttys'

Puppet::Type.type(:ttys).provide(:parsed, :parent => Puppet::Provider::ParsedFile, :default_target => tty_file, :filetype => :flat) do

	desc "Provider for FreeBSD for modifying /etc/ttys "
	defaultfor :operatingsystem => :freebsd

	text_line :comment, :match => %r{^#}
	text_line :blank, :match => %r{^\s*$}

	record_line :parsed, :fields => %w{name getty type status comment}, :optional => %w{status comment}, :separator => /\t+/, :joiner => "\t" 

	
end
