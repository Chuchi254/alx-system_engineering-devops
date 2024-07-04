# kills a process named killmenoew

exec { 'pkill -f killnenow':
  path => ['/usr/bin', '/usr/locale/bin', '/bin']',
}
