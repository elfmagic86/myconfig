# hcr



## dcevm

TODO 여러 프로젝트에서 동일 설정시 소켓관련 펜딩 걸림 
	차후 재시도.

https://github.com/dcevm/dcevm


- 설치
A or B

  A. Replace libjvm.so/jvm.dll/libjvm.dylib in the target JRE. 
	jvm args
	-XXaltjvm=dcevm

  - 확인
  Run java -version, it should include Dynamic Code Evolution string.

  B. DCEVM will be installed as "alternative" JVM
     to use it, add -XXaltjvm=dcevm

  - 이클립스 적용
	http://hotswapagent.org/mydoc_quickstart.html

	-XXaltjvm=dcevm -javaagent:PATH_TO_AGENT\hotswap-agent.ja


-XXaltjvm=dcevm -javaagent:D:\kang\program\scouter\agent.java\scouter.agent.jar -Dobj_name=iop-admin-api -Xms128M -Xmx512M
	-XXaltjvm=dcevm -javaagent:D:\kang\program\java-hcr\hotswap-agent-1.3.0.jar -Xms128M -Xmx512M
	-javaagent:D:\kang\program\scouter\agent.java\scouter.agent.jar -Dobj_name=iop-cs-api -Xms128M -Xmx512M


- full
-XXaltjvm=dcevm -javaagent:D:\kang\program\java-hcr\hotswap-agent-1.3.0.jar -javaagent:D:\kang\program\scouter\agent.java\scouter.agent.jar -Dobj_name=iop-admin-api -Xms128M -Xmx512M

	- enable
		- You can use standard Java Hotswap from IDE in debug mode to reload changed class
		- set autoHotswap property -XXaltjvm=dcevm -javaagent:PATH_TO_AGENT\hotswap-agent.jar=autoHotswap=true to reload changed classes after compilation. This setup allows even reload on production system without restart.
			-XXaltjvm=dcevm -javaagent:D:\kang\program\java-hcr\hotswap-agent-1.3.0.jar=autoHotswap=true -javaagent:D:\kang\program\scouter\agent.java\scouter.agent.jar -Dobj_name=iop-admin-api -Xms128M -Xmx512M

			- 이슈로 추가
			  scouter agent로 추가할경우 에러( sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method))
				https://github.com/HotswapProjects/HotswapAgent/issues/180
				disablePlugin=AnonymousClassPatch

-XXaltjvm=dcevm -javaagent:D:\kang\program\java-hcr\hotswap-agent-1.3.0.jar -Xms128M -Xmx512M

- 서클릿컨테이너별
	- jetty 
		extraClasspath=



-  상세설정
http://hotswapagent.org/mydoc_configuration.html
