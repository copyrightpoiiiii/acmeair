param($begin,$end,$val,$model)
if($model -eq 1)
{
    $acmeaircmd = "NodejsPid=`$(ps -ef|grep nodejs|grep -v grep|awk '{print `$2}'); echo "+$val+' > /proc/$NodejsPid/sched_min_granularity_ns'
    $mongocmd = "mongoPid=`$(ps -ef|grep mongo|grep -v grep|awk '{print `$2}'); echo "+$val+' > /proc/$mongoPid/sched_min_granularity_ns'
    for($i=$begin;$i -le $end;$i++)
    {
        $acmeair = "acmeair_web_" + $i
        docker exec -d $acmeair bash -c $acmeaircmd
        $mongo = "mongo_"+ $i
        docker exec -d $mongo bash -c $mongocmd
    }
}
else
{
    $ffmpegcmd = "ffmpegPid=`$(ps -ef|grep ffmpeg|grep -v grep|awk '{print `$2}'); echo "+$val+' > /proc/$ffmpegPid/sched_min_granularity_ns'
    for($i=$begin;$i -le $end;$i++)
    {
        $ffmpeg = "ffmpeg_" + $i
        docker exec -d $ffmpeg bash -c $ffmpegcmd
    }
}