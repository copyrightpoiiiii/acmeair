param($acmeair_ip,[int]$acmeair_port)
for($i=0;$i -le 10;$i+=2)
{
    write-host $acmeair_ip : ($port=$acmeair_port+$i)
    docker run -i -t -P -d -e APP_PORT_9080_TCP_ADDR=$acmeair_ip -e APP_PORT_9080_TCP_PORT=$port copyright.azurecr.io/acmeair/workload
}
