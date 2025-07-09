





$path = "\processor(_total)\% Processor Time"


while(1) {
    $getCounterPath = get-counter $path;
    $outputString = "Timestamp: " + $getCounterpath.Timestamp.ToString() + "  ||  Cooked Value: " + $getCounterPath.CounterSamples.CookedValue;
    $outputString;
    # start-sleep 1;
}

