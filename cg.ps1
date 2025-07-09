$i = 0;
$timeSince = 0;
$totalBowfa = 0;
$dropRate = 400;

while (1) {
    $drop = Get-Random -Maximum 400
    
        
    # Write-Output "KC: $i" 
    # Write-Output "drop:  $drop" 


    if ($drop -eq 0) {
        $totalBowfa++
        # $dropRate = System.Math::Floor(12.2);

        # if ($timeSince -ge 4000) {
        Write-Output "Bowfa Obtained! KC: $i, timeSince: $timeSince, total: $totalBowfa" 

        # }
        # break;
        $timeSince = 0;
    }
    $timeSince++;
    $i++;
}