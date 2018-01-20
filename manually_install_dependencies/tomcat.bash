# NOTE: 개발용.권한신경안씀
#   현재는 설치유저가 소유자이기에 전체권한가짐

# 설치
cd /tmp
wget http://mirror.navercorp.com/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
tar -xzvf apache-tomcat-8.5.20.tar.gz
sudo mv /tmp/apache-tomcat-8.5.20 /opt/tomcat


# 실행하기(path설정할것)
    # $ $CATALINA_HOME/bin/startup.sh 
    # 포트확인
    # $ netstat -plntu

# TODO 권한관련
# https://superuser.com/questions/632618/best-practice-for-access-permission-to-users-for-apache-tomcat
