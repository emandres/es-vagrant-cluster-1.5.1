add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y openjdk-8-jre

wget -q https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.1.deb
dpkg -i elasticsearch-1.5.1.deb

echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment
source /etc/environment

cat >> /etc/elasticsearch/elasticsearch.yml <<EOL
network.host: [_eth1:ipv4_, _local_]
network.publish_host: _eth1:ipv4_
EOL

update-rc.d elasticsearch defaults 95 10
service elasticsearch start
