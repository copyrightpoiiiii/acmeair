param($acmeair_ip,[int]$acmeair_port,[int]$size)
for($i=1;$i -le $size;$i++)
{
    write-host $acmeair_ip : ($port=$acmeair_port+3*($i-1))
    docker run -i -t -P -d -e APP_PORT_9080_TCP_ADDR=$acmeair_ip -e APP_PORT_9080_TCP_PORT=$port copyright.azurecr.io/acmeair/workload
}

$containers = docker ps -aq

for($i=0;$i -lt $size;$i++)
{
    docker logs $containers[i]
}

docker rm $(docker ps -aq)