para($acmeair_ip,[int]$acmeair_port)
for($i=0;$i -le 10;$i+=2)
{
    write-host $acmeair_ip : $acmeair_port
    docker run -i -t -P -d -e APP_PORT_9080_TCP_ADDR=$acmeair_ip -e APP_PORT_9080_TCP_PORT=($acmeair_port+$i) acmeair/workload
}
