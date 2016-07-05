NGINX_VERSION = "1.9.15-1"
NGINX_DEB_VERSION = NGINX_VERSION + "~jessie"

NODEJS_VERSION = "6.2.2-1"
NODEJS_DEB_VERSION = NODEJS_VERSION + "nodesource1~jessie1"

ZULU_VERSION = "8.15.0.1"

ZOOKEEPER_VERSION = "3.4.8"

SBT_VERSION = "0.13.11"

POSTGRESQL_VERSION = "9.5.3-1"
POSTGRESQL_DEB_VERSION = POSTGRESQL_VERSION + ".pgdg80+1"
POSTGIS_VERSION = "2.2.2"
POSTGIS_CONTAINER_VERSION = POSTGRESQL_VERSION + "-" + POSTGIS_VERSION
POSTGIS_DEB_VERSION = POSTGIS_VERSION + "+dfsg-1.pgdg80+1"

REDIS_VERSION = "3.2.1-1"
REDIS_DEB_VERSION = REDIS_VERSION + "~bpo8+1"

TOMCAT7_VERSION = "7.0.56-3"
TOMCAT7_DEB_VERSION = TOMCAT7_VERSION + "+deb8u2"

MAVEN_VERSION = "3.3.9"

PHP_VERSION = "7.0.7-5"

PROMETHEUS_VERSION = "0.19.2"

GRAFANA_VERSION = "3.0.4"

NEXUS_VERSION = "2.13.0-01"

POLIPO_VERSION = "1.1.1-5"

JENKINS_VERSION = "1.651.3"
JENKINS_SWARM_VERSION = "2.1"

def _version_shell_script_impl(ctx):
  # (.+)=(%\{.+\})   =>   "$2": $1,
  ctx.template_action(
    template=ctx.file._template,
    substitutions={
      "%{NGINX_VERSION}": NGINX_VERSION,
      "%{NGINX_DEB_VERSION}": NGINX_DEB_VERSION,
      "%{NODEJS_VERSION}": NODEJS_VERSION,
      "%{NODEJS_DEB_VERSION}": NODEJS_DEB_VERSION,
      "%{ZULU_VERSION}": ZULU_VERSION,
      "%{ZOOKEEPER_VERSION}": ZOOKEEPER_VERSION,
      "%{SBT_VERSION}": SBT_VERSION,
      "%{POSTGRESQL_VERSION}": POSTGRESQL_VERSION,
      "%{POSTGRESQL_DEB_VERSION}": POSTGRESQL_DEB_VERSION,
      "%{POSTGIS_VERSION}": POSTGIS_VERSION,
      "%{POSTGIS_CONTAINER_VERSION}": POSTGIS_CONTAINER_VERSION,
      "%{POSTGIS_DEB_VERSION}": POSTGIS_DEB_VERSION,
      "%{REDIS_VERSION}": REDIS_VERSION,
      "%{REDIS_DEB_VERSION}": REDIS_DEB_VERSION,
      "%{TOMCAT7_VERSION}": TOMCAT7_VERSION,
      "%{TOMCAT7_DEB_VERSION}": TOMCAT7_DEB_VERSION,
      "%{MAVEN_VERSION}": MAVEN_VERSION,
      "%{PHP_VERSION}": PHP_VERSION,
      "%{PROMETHEUS_VERSION}": PROMETHEUS_VERSION,
      "%{GRAFANA_VERSION}": GRAFANA_VERSION,
      "%{NEXUS_VERSION}": NEXUS_VERSION,
      "%{POLIPO_VERSION}": POLIPO_VERSION,
      "%{JENKINS_VERSION}": JENKINS_VERSION,
      "%{JENKINS_SWARM_VERSION}": JENKINS_SWARM_VERSION,
    },
    output=ctx.outputs.script
  )

version_shell_script = rule(
  implementation=_version_shell_script_impl,
  attrs={
    "_template": attr.label(
      default=Label("//scripts/versions:template"),
      single_file=True,
      allow_files=True)
  },
  outputs={
    "script": "%{name}.sh"
  },
)