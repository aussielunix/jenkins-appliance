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

  install-jenkins-plugin {'github-plugin':
    name => 'github'
  }

  install-jenkins-plugin {'greenballs-plugin':
    name => 'greenballs'
  }

  install-jenkins-plugin {'ruby-plugin':
    name => 'ruby'
  }

  install-jenkins-plugin {'rake-plugin':
    name => 'rake'
  }

  install-jenkins-plugin {'ssh-plugin':
    name => 'ssh'
  }

  install-jenkins-plugin {'monitoring-plugin':
    name => 'monitoring'
  }
}
