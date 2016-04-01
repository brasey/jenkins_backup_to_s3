class jenkins_backup_to_s3 {

  $bucket      = hiera('bucket')
  $path        = hiera('path')
  $jenkins_dir = hiera('jenkins_dir')

  file { '/etc/cron.daily/jenkins_backup.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0775'
    content => template('jenkins_backup_to_s3/jenkins_backup.sh.erb'),
  }

  file { "${jenkins_dir}/jenkins_backup_exclusions.txt":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => 'puppet:///jenkins_backup_to_s3/modules/jenkins_backup_exclusions.txt',
  }

}
