### Find out how much MB is left when the partition used for /var/log/audit/ has reached 75% used.
### This fact is later used for setting the 'space_left' value in /etc/audit/auditd.conf and will satisfy STIG rule: SV-86713r3. 

Facter.add('auditd_space_left') do
	confine :kernel => %w{ Linux }
	setcode do
		Facter::Core::Execution.execute('echo $(( $(df --output=size -BM /var/log/audit/ | grep -v 1M-blocks | grep -o "[[:digit:]]\+") * 25 / 100 ))')
	end
end
