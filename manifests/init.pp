class jenkins_backup_to_s3 {

  $bucket      = hiera('bucket')
  $path        = hiera('path')
  $jenkins_dir = hiera('jenkins_dir')
  $date_cmd    = hiera('date_cmd')
  $nice_cmd    = hiera('nice_cmd')
  $tar_cmd     = hiera('tar_cmd')
  $aws_cmd     = hiera('aws_cmd')

  file { '/etc/cron.daily/jenkins_backup.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
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
