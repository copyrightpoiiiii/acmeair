param($size,$model)
if($model -eq 1)
{
    $separators = (":","-")
    for($i=1;$i -le $size;$i++)
    {
        $mongo = "mongo_"+ $i
        $acmeair = "acmeair_web_" + $i
        docker run --name $mongo -d -P mongo
        docker run -d -P --name $acmeair --link $mongo":mongo" acmeair/web 
        $getPsInfo = docker ps
        $containerStat = $getPsInfo[1]
        $port = $containerStat.split($separators)
        $uri = "http://localhost:"+$port[1]+"/rest/api/loader/load?numCustomers=10000"
        Invoke-WebRequest -UseBasicParsing http://localhost:49158/rest/api/loader/load?numCustomers=10000
    }
}
else
{
    for($i=1;$i -le $size;$i++)
    {
        $mongo = "mongo_"+ $i
        $acmeair = "acmeair_web_" + $i
        docker stop $acmeair | docker rm $acmeair
        docker stop $mongo | docker rm $mongo
    }
}