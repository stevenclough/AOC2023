$filepath = "1-1input.txt"
$filecontent = Get-Content -Path $filepath

$array = @()

Get-Content -Path $filepath | ForEach-Object {
    $array += $_
}


foreach ($currentstring in $array) {
    $numbers = [regex]::Matches($currentstring, '\d').Value
    if ($numbers.count -eq 1) {
        $numbers = $numbers * 2
    }
    $firstno = $numbers[0]
    $lastno = $numbers[-1]
    $sum = ($firstno + $lastno)
    $arrayresult = ($sum | ForEach-Object { [int]$_}) -join '+'
    $arrayresult = [int]$arrayresult
    [int]$result = $arrayresult + $result
}

Write-Output "Sum of numbers: $result"
