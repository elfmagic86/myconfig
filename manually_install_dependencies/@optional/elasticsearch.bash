# 5.6.3 기준
# https://www.elastic.co/guide/en/elasticsearch/reference/current/zip-targz.html
# ===

# required
# ---

# - Java version 1.8.0_131 or later. 
# - Elasticsearch ships with default configuration for running Elasticsearch on 64-bit server JVMs. If you are using a 32-bit client JVM, you must remove -server from jvm.options and if you are using any 32-bit JVM you should reconfigure the thread stack size from -Xss1m to -Xss320k.

# install
# ---
es_root=~/elasticsearch
mkdir -p $es_root


cd $es_root
if [ ! -d './elasticsearch-5.6.3' ]; then
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.3.tar.gz
    sha1sum elasticsearch-5.6.3.tar.gz 
    tar -xzf elasticsearch-5.6.3.tar.gz
fi
