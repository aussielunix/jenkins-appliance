node default {
  include apt
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
    'vsphere-cloud',
    'warnings',
    'analysis-core',
    'rvm',
    'htmlpublisher',
    'xfpanel'
  ]

  jenkins::plugin { $plugins: }
}
