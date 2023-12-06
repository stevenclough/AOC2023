$puzzlenumber = "4"
# $mode = Read-Host "Test Data? Y/N" 

# if ($mode = "Y") {
#     $filepath = "$puzzlenumber-test-input.txt"
# }
# else {
#     $filepath = "$puzzlenumber-live-input.txt"
#     }

$filepath = "$puzzlenumber-live-input.txt"
$winarray = @{}
$cardarray = @{}
$count = 0

Get-Content -Path $filepath | ForEach-Object {
    $splitstring = $_ -split ':', 2
    $trimstring = $splitstring[1].Trim()
    $splittrimstring = $trimstring -split '\|', 2
    $winarray["$count"] += $splittrimstring[0].Trim() -split '\s+'
    $cardarray["$count"] += $splittrimstring[1].Trim() -split '\s+'
    $count++
}

$countcard = 0
$countwin = 0
$tally = 0

foreach ($key1 in $cardarray.Keys) {
    $cardscore = 0
    foreach ($value1 in $cardarray["$key1"]) {
        # Write-Host ("Test $([int]$key1 + 1) $value1 vs $($winarray["$key1"])")
        if ($winarray["$key1"] -contains $value1) {
            $cardscore++
            # $tally++
            # Write-Host "Win Line $Key1"
        }
    }
    # Write-host "Line $key1, Score $cardscore"
    if ($cardscore -gt 1) {
        $cardtotal = [Math]::Pow(2, ([int]$cardscore - 1))
        }
    else {
        $cardtotal = $cardscore
    }
    $tally = $tally + $cardtotal
}

$tally
