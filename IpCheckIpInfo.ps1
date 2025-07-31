    $ipInfo = Invoke-RestMethod -Uri "http://ipinfo.io/json"
    $ipInfo.ip
    $ipInfo.city
    $ipInfo.country