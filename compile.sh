TOMCAT_HOME='/opt/tomcat'
javac -classpath "$TOMCAT_HOME/lib/*:$TOMCAT_HOME/escenic/lib/*:$TOMCAT_HOME/webapps/frontend/WEB-INF/classes:$TOMCAT_HOME/webapps/frontend/WEB-INF/lib/*" $(find -name '*.java')
