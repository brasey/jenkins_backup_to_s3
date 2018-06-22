# jenkins_backup_to_s3

## Summary

Backup your Jenkins to an S3 bucket using Puppet.

Just a cron job and a script to back up your Jenkins master.

A sample hiera yaml is included.

## Assumptions

* awscli installed
* able to put things in an S3 bucket from your Jenkins master (IAM Role and Instance Profile, probably)
* a hiera store with some variables in it. See top of init.pp.
