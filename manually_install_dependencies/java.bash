
# ppa로 설치
# https://www.linode.com/docs/development/install-java-on-ubuntu-16-04

    # 1. ppa
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update

        # 위의 ppa에서 원하는 자바버전선택
        # sudo apt-cache search oracle-java

    # 2. install java9(include jre, jdk)
    # 첫인스톨시 라이센스.
    sudo apt install oracle-java9-installer

    # 3. 환경변수(JAVA_HOME, PATH..
    # 위의 인스톨러로 설치시 /etc/profile.d/jdk.sh 도 설치되며 환경변수 설정이 잡힘
    # non_login_shell을 위해 직접 처리를해줘야함(나는 위의 path를 실행해주는 부분을 추가함)


    # 수작업
    # 4. 버전 관리?
        # 1. 현재 사용되는 버전 확인 및 변경
        # sudo update-alternatives --config java

        # 2. 환경변수
        # install시 profile.d/jdk.sh를 변경해줌. 위의 사용버전?은 별개로 변경해줘야함
        # sudo apt-get install oracle-java9-set-default \

