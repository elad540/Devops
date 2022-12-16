curl http://192.168.49.2:32000/jnlpJars/jenkins-cli.jar --output /opt/jenkins-cli.jar
#waiting when jenkins will be up for download
#while true; do
#   sleep 10
#   curl --fail http://192.168.49.2:32000/jnlpJars/jenkins-cli.jar --output /opt/jenkins-cli.jar && break
# done


UPDATE_LIST=$(java -jar /opt/jenkins-cli.jar -s http://192.168.49.2:32000/ -auth "admin:lPj9FKpusojI9ko1XYlG68" list-plugins | grep -e ')$' | awk '{ print $1 }' );
if [ ! -z "${UPDATE_LIST}" ]; then
echo Updating Jenkins Plugins: ${UPDATE_LIST};
java -jar /opt/jenkins-cli.jar -s http://192.168.49.2:32000/ -auth "admin:lPj9FKpusojI9ko1XYlG68" install-plugin ${UPDATE_LIST};
java -jar /opt/jenkins-cli.jar -s http://192.168.49.2:32000/ -auth "admin:lPj9FKpusojI9ko1XYlG68" safe-restart;
fi

