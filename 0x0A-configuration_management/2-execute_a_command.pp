# kills a process named killmenoew

exec { 'pkill -f killmenow':
  path => '/usr/bin/:/usr/local/bin/:/bin/',
}
