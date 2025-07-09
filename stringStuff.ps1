while (1) {
    $denyList = [System.Collections.Generic.List[Int]]::new();
    $duplicateList = [System.Collections.Generic.List[Int]]::new();
    $failFlag = $false;

    #User inputs string to test. Could make this read in from a file instead.
    $userInput = Read-Host  "Please enter your string";
    
    #Split the iniital user input based on '\' (or any delimter)
    $stringSplitOnSlash = $userInput -split "\\";

    #for every section you've broken the initial input into (sections delimited by '\'), 
    for ($i = 0; $i -lt $stringSplitOnSlash.Length; $i++) {

        if ($failFlag) {
            break;
        }
       
        #split on ',' as well
        $stringSplitOnComma = $stringSplitOnSlash[$i] -split ",";

        #for every individual element in list, check if is a tuple range (x-y) or primitive
        for ($j = 0; $j -lt $stringSplitOnComma.Length; $j++) {

            #if tuple, loop over range of tuple and add all to deny list, if collision, fail. If not tuple, standard add to denylist (check for collision and fail accordingly) and break.
            if ($stringSplitOnComma[$j].Contains("-")) {
                $stringSplitOnDash = $stringSplitOnComma[$j] -split "-";
                
                $start = [Int]$stringSplitOnDash[0];
                $stop = [Int]$stringSplitOnDash[1];

                #this only works if in form minNumber-maxNumber in a tuple
                for ($k = $start; $k -le $stop; $k++) {
                    $numberToCheck = $k;

                    if ($denyList -contains $numberToCheck ) {
                        $failFlag = $true;
                        $duplicateList.add($numberToCheck);
                        break;
                    }
                    else {                   
                        $denyList.add($numberToCheck);
                    }

                }
            }
            else {
                if ($denyList -contains $stringSplitOnComma[$j] ) {
                    $failFlag = $true;
                    $duplicateList.add($stringSplitOnComma[$j]);
                    break;
                }
                else {                   
                    $denyList.add($stringSplitOnComma[$j]);
                }
            }

        }

    }

    if ($failFlag) {
        write-host "The string has FAILED! Found duplicates were: $duplicateList" ;
    }
    else {
        write-host "The string has PASSED :)" ;
    }

}


#Notes:
# Could even prompt the user based on what they want to split on. Would be an easy change. Feature flag?
# 
# Does not currently work with negative numbers because we are checking for '-' lol.
# 
# Could use tuples for duplicate list with the position in the list for user convenience.
#
# Currently I short circuit the loop when a duplicate is found, so a full duplicate list is enver populated. Could change this by removing the break command if duplicate identification was required.