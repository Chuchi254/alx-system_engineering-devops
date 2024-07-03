# Ensure the /etc/ssh/ssh_config file exists
file { '/etc/ssh/ssh_config':
	ensure	=> 'present',
}

# Add the configuration to disable password authentication
file_line { 'Turn off passwd auth':
	path	=> '/etc/ssh/ssh_config',
	line	=> 'PasswordAuthentication no',
	match	=> 'PasswordAuthentication yes',
	replace	=> true,
}

# Add the identity file configuration
file_line { 'Declare identity file':
	path	=> '/etc/ssh/ssh_config',
	line	=> 'IdentityFile ~/.ssh/config',
	match	=> '^IdentityFile',
}	
