#!/usr/bin/env bash
# Ensure the /etc/ssh/ssh_config file exists

include stdlib

# Add the configuration to disable password authentication
file_line { 'SSH Private Key':
  path	           => '/etc/ssh/ssh_config',
  line	           => '    IdentityFile ~/.ssh/school',
  match	           => '^[#]+[\s]*(?i)IndentityFile[\s]+~/.ssh/id_rsa$',
  replace	           => true,
  append_on_no_match => true
}

# Regex match explanation
#
# ^	beginning of the line
# [#]*  atleat one hash character
# [\s]* zero or more white space characters
# (?i)IndetityFile case insensitive "IdentityFile"
# [\s]+ at least one whitespace character
# ~/.ssh/id_rsa The ssh private key file path we want to replace
# $	end of the line

file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

# Regex match explanation
#
# ^	beginning of the line
# [#]*  atleat one hash character
# [\s]* zero or more white space characters
# (?i)PasswordAuthentication case insensitive "PasswordAuthentication"
# [\s]+ at least one whitespace character
# (yes|no) with the value "yes" or the value "no"
# $	end of the line
