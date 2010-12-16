# simple type and provider example to show how to use the rcconf type.
# the default target is /etc/rc.conf
# Right now the value need to be quoted as shown if quotes are wanted for the value
class freebsd{
#
#	rcconf{ "foo":
#		ensure => "present",
#		value => '"bar"';
#	}
#	rcconf{ "ifconfig_em0":
#		ensure => "present",
#		target => "/etc/rc.conf.test",
#		value  => '"inet 3.3.3.4/24"';
#	}
	ttys{ "ttyu0":
		getty  => '"/usr/libexec/getty console"',
		type   => 'vt100',
		status => 'on secure',
		comment => "#Changed by puppet";
	}	
		
}
