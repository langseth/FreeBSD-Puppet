class motd{
}

class motd::freebsd{
	file{ "/etc/motd.puppet":
		source => "puppet:///motd/motd-freebsd",
#		notify => Exec["cp /etc/motd.puppet /etc/motd"];
	}
	exec{ "cp /etc/motd.puppet /etc/motd":
		path => "/bin:/usr/bin",
		subscribe => File["/etc/motd.puppet"],
		refreshonly => true,
	}
	
	exec{ "/etc/rc.d/motd restart":
		path => "/bin:/usr/bin",
		subscribe => Exec["cp /etc/motd.puppet /etc/motd"],
		refreshonly => true,
	}
}
