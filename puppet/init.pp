node default {
  include stdlib
  include jenkins

  $plugins = [ 
    'git',
    'chucknorris',
    'github',
    'greenballs',
    'ruby',
    'rake',
    'ssh',
    'monitoring',
    'favorite',
    'gravatar',
    'jabber',
    'sounds',
    'radiatorviewplugin',
    'vsphere-cloud'
  ]

  jenkins::plugin::install { $plugins: }

}
