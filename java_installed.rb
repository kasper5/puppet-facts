Facter.add('java_installed') do
	confine :osfamily => 'RedHat'
	setcode do
		Facter::Core::Execution.execute('command -v java >/dev/null && /usr/bin/java -version 2>&1 | awk -F\" \'/version/ {print $2}\'')
	end
end
Facter.add('java_installed') do
	confine :osfamily => 'FreeBSD'
	setcode do
		Facter::Core::Execution.execute('command -v java >/dev/null && /usr/local/bin/java -version 2>&1 | awk -F\" \'/version/ {print $2}\'')
	end
end
