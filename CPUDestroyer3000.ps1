# $nextValue = 2;

# while(1) {
#     $nextValue = [Math]::pow($nextValue, 2)
#     # $nextValue;

# }

# for ($i = 0; $i -lt 10; $i++) {
#     start-process powershell -ArgumentList "-Command", {
#         while(1){
#             1..10000 | ForEach-Object { [Math]::Sqrt($_) } | out-null;
#         }        
#     }
# }

# Caution: dont do too many of these...
for ($i = 0; $i -lt 10; $i++) {
    start-process powershell -ArgumentList "-Command", {
        1..10000 | ForEach-Object { [Math]::Sqrt($_) } | out-null;
    }
}