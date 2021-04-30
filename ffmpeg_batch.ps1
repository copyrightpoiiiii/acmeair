param($model)
if($model -eq 1)
{
    for($i=1;$i -le 12;$i++)
    {
        $inFile = "D:\docker-test-" + $i+":/tmp/workdir"
        $ffmpeg_name = "ffmpeg_" + $i
        docker run -d --name $ffmpeg_name -v $inFile jrottenberg/ffmpeg -i /tmp/workdir/clannad_test.mkv -threads 1  -c:v libx264 -crf 28 -strict -2 /tmp/workdir/test.mp4
    }
}
if($model -eq 2)
{
    for($i = 1;$i -le 12;$i++)
    {
        $name = "ffmpeg_"+$i
        $state = docker container inspect $name
        $jsonState = $state | ConvertFrom-Json
        $jsonState.state.startedAt
        $jsonState.state.startedAt
        $startTime = $jsonState.state.startedAt
        $endTime = $jsonState.state.FinishedAt
        new-TIMESPAN -start $startTime -end $endTime
    }
}
if($model -eq 3)
{
    for($i=1;$i -le 12;$i++)
    {
        $name = "ffmpeg_"+$i
        $state = docker container inspect $name
        $jsonState = $state | ConvertFrom-Json
        $jsonState.state.startedAt
        $jsonState.state.startedAt
        $startTime = $jsonState.state.startedAt
        $endTime = $jsonState.state.FinishedAt
        new-TIMESPAN -start $startTime -end $endTime
        $ffmpeg_name = "ffmpeg_" + $i
        $outFile = "D:\docker-test-" + $i+"\test.mp4"
        docker rm $ffmpeg_name
        rm $outFile
    }
}