NGINX_VERSION = "1.17.9-1"
NGINX_DEB_VERSION = NGINX_VERSION + "~buster"

NODEJS_VERSION = "12.16.2"
YARN_VERSION = "1.22.4"

ZULU_8_VERSION = "8.44.0.11"
JAVA_8_VERSION = "8.0.242"
ZULU_11_VERSION = "11.37+17"
JAVA_11_VERSION = "11.0.6"
JAVA_VERSION = JAVA_8_VERSION
GRAAL_VERSION = "20.0.0"

ZOOKEEPER_VERSION = "3.4.14"
KAFKA_VERSION = "2.4.1"

ELASTICSEARCH_VERSION = "7.3.1"

KIBANA_VERSION = "7.3.1"
NODEJS_FOR_KIBANA_VERSION = "10.15.2"

SBT_VERSION = "1.3.9"

POSTGRESQL_MAJOR_VERSION = "12"
POSTGRESQL_VERSION = POSTGRESQL_MAJOR_VERSION + "." + "2-2"
POSTGRESQL_DEB_VERSION = POSTGRESQL_VERSION + "." + "pgdg100+1"
POSTGIS_MINOR_VERSION = "3"
POSTGIS_VERSION = POSTGIS_MINOR_VERSION + ".0.1"
POSTGIS_CONTAINER_VERSION = POSTGRESQL_VERSION + "-" + POSTGIS_VERSION
POSTGIS_DEB_VERSION = POSTGIS_VERSION + "+dfsg-2.pgdg100+1"
POSTGIS_POSTGRESQL_DEB_VERSION = POSTGIS_DEB_VERSION

REDIS_VERSION = "5.0.7-1"
REDIS_DEB_VERSION = REDIS_VERSION + "~bpo10+1"

TOMCAT9_VERSION = "9.0.16-4"
TOMCAT9_DEB_VERSION = TOMCAT9_VERSION + ""

MAVEN_VERSION = "3.6.3"

PHP_VERSION = "7.3.14-1"
PHP_DEB_VERSION = PHP_VERSION + "~deb10u1"

PROMETHEUS_VERSION = "2.12.0"
PROMETHEUS_JMX_JAVAAGENT = "0.11.0"

GRAFANA_VERSION = "6.5.1"
GRAFANA_DEB_VERSION = GRAFANA_VERSION

CASSANDRA_VERSION = "3.11.6"
CASSANDRA_DEB_VERSION = CASSANDRA_VERSION + "_all"

NEXUS_VERSION = "2.14.15-01"

GERRIT_VERSION = "3.1.4"

DNSMASQ_VERSION = "2.80-1"
DNSMASQ_DEB_VERSION = DNSMASQ_VERSION + ""

ERLANG_VERSION = "22.0.7-1"
ERLANG_DEB_VERSION = ERLANG_VERSION + ""

RABBITMQ_VERSION = "3.7.13"

EJABBERD_VERSION = "18.06"

ZIPKIN_VERSION = "2.19.2"

JENKINS_VERSION = "2.222.1"
JENKINS_SWARM_VERSION = "3.17"

JASPERREPORTS_SERVER_VERSION = "6.4.2"

PENATHO_DI_VERSION = "7.1.0.0-12"

def _version_shell_script_impl(ctx):
  # (.+)=(%\{.+\})   =>   "$2": $1,
  ctx.actions.expand_template(
    template=ctx.file._template,
    substitutions={
      "%{NGINX_VERSION}": NGINX_VERSION,
      "%{NGINX_DEB_VERSION}": NGINX_DEB_VERSION,
      "%{NODEJS_VERSION}": NODEJS_VERSION,
      "%{YARN_VERSION}": YARN_VERSION,
      "%{ZULU_8_VERSION}": ZULU_8_VERSION,
      "%{JAVA_8_VERSION}": JAVA_8_VERSION,
      "%{ZULU_11_VERSION}": ZULU_11_VERSION,
      "%{JAVA_11_VERSION}": JAVA_11_VERSION,
      "%{JAVA_VERSION}": JAVA_VERSION,
      "%{GRAAL_VERSION}": GRAAL_VERSION,
      "%{ZOOKEEPER_VERSION}": ZOOKEEPER_VERSION,
      "%{KAFKA_VERSION}": KAFKA_VERSION,
      "%{ELASTICSEARCH_VERSION}": ELASTICSEARCH_VERSION,
      "%{KIBANA_VERSION}": KIBANA_VERSION,
      "%{NODEJS_FOR_KIBANA_VERSION}": NODEJS_FOR_KIBANA_VERSION,
      "%{SBT_VERSION}": SBT_VERSION,
      "%{POSTGRESQL_MAJOR_VERSION}": POSTGRESQL_MAJOR_VERSION,
      "%{POSTGRESQL_VERSION}": POSTGRESQL_VERSION,
      "%{POSTGRESQL_DEB_VERSION}": POSTGRESQL_DEB_VERSION,
      "%{POSTGIS_MINOR_VERSION}": POSTGIS_MINOR_VERSION,
      "%{POSTGIS_VERSION}": POSTGIS_VERSION,
      "%{POSTGIS_CONTAINER_VERSION}": POSTGIS_CONTAINER_VERSION,
      "%{POSTGIS_DEB_VERSION}": POSTGIS_DEB_VERSION,
      "%{POSTGIS_POSTGRESQL_DEB_VERSION}": POSTGIS_POSTGRESQL_DEB_VERSION,
      "%{REDIS_VERSION}": REDIS_VERSION,
      "%{REDIS_DEB_VERSION}": REDIS_DEB_VERSION,
      "%{TOMCAT9_VERSION}": TOMCAT9_VERSION,
      "%{TOMCAT9_DEB_VERSION}": TOMCAT9_DEB_VERSION,
      "%{MAVEN_VERSION}": MAVEN_VERSION,
      "%{PHP_VERSION}": PHP_VERSION,
      "%{PHP_DEB_VERSION}": PHP_DEB_VERSION,
      "%{PROMETHEUS_VERSION}": PROMETHEUS_VERSION,
      "%{GRAFANA_VERSION}": GRAFANA_VERSION,
      "%{GRAFANA_DEB_VERSION}": GRAFANA_DEB_VERSION,
      "%{CASSANDRA_VERSION}": CASSANDRA_VERSION,
      "%{CASSANDRA_DEB_VERSION}": CASSANDRA_DEB_VERSION,
      "%{NEXUS_VERSION}": NEXUS_VERSION,
      "%{GERRIT_VERSION}": GERRIT_VERSION,
      "%{DNSMASQ_VERSION}": DNSMASQ_VERSION,
      "%{DNSMASQ_DEB_VERSION}": DNSMASQ_DEB_VERSION,
      "%{ERLANG_VERSION}": ERLANG_VERSION,
      "%{ERLANG_DEB_VERSION}": ERLANG_DEB_VERSION,
      "%{RABBITMQ_VERSION}": RABBITMQ_VERSION,
      "%{EJABBERD_VERSION}": EJABBERD_VERSION,
      "%{ZIPKIN_VERSION}": ZIPKIN_VERSION,
      "%{JENKINS_VERSION}": JENKINS_VERSION,
      "%{JENKINS_SWARM_VERSION}": JENKINS_SWARM_VERSION,
      "%{JASPERREPORTS_SERVER_VERSION}": JASPERREPORTS_SERVER_VERSION,
      "%{PENATHO_DI_VERSION}": PENATHO_DI_VERSION,
    },
    output=ctx.outputs.script
  )

version_shell_script = rule(
  implementation=_version_shell_script_impl,
  attrs={
    "_template": attr.label(
      default=Label("//scripts/versions:template"),
      allow_single_file=True,
    )
  },
  outputs={
    "script": "%{name}.sh"
  },
)
