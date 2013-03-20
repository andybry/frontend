TOMCAT_HOME='../..'
javac -classpath "$TOMCAT_HOME/lib/*:$TOMCAT_HOME/escenic/lib/*:$TOMCAT_HOME/webapps/publication/WEB-INF/classes:$TOMCAT_HOME/webapps/publication/WEB-INF/lib/*" $(find -name '*.java')
