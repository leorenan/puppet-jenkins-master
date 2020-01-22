class jenkinsmaster {
        file{ "/etc/yum.repos.d/jenkins.repo":
                source => "https://pkg.jenkins.io/redhat-stable/jenkins.repo",
        }

        package{ "java-1.8.0-openjdk.x86_64":
                ensure => "present",
        }
        package{ "jenkins":
                ensure => "present",
        }

        file { "/var/tmp/ldap.jar":
                source => "https://updates.jenkins.io/latest/ldap.hpi",
        }

        file { "/tmp/ldap":
 ensure => directory,
}

archive { '/tmp/ldap/ldap.jar':
#  ensure        => present,
  extract       => true,
  extract_path  => "/tmp/ldap",
  source        => "https://updates.jenkins.io/latest/ldap.hpi",
}
        service { "jenkins":
                ensure     => "running",
                enable     => true,
                hasstatus  => true,
                hasrestart => true,
        }
}
