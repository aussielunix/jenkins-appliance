Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin' }


node default {
  include stdlib
  include jenkins

  install-jenkins-plugin {'git-plugin':
    name => 'git'
  }

  install-jenkins-plugin {'chucknorris-plugin':
    name => 'chucknorris'
  }
}
