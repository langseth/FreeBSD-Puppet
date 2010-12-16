require 'puppet/provider/parsedfile'

rc_file = '/etc/rc.conf'

Puppet::Type.type(:rcconf).provide(:parsed, :parent => Puppet::Provider::ParsedFile, :default_target => rc_file, :filetype => :flat) do

	desc "Provider for FreeBSD, Sets up Abitrary rc_flags in the rc conf files"
	defaultfor :operatingsystem => :freebsd

	text_line :comment, :match => %r{^#}
	text_line :blank, :match => %r{^\s*$}

	record_line :parsed, :fields => %w{name value}, :separator => "=", :joiner => "=" 

	
end
