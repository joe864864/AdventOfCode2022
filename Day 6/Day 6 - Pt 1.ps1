#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/9/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 6 - Input.txt"

foreach($line in $data){
    for($i=0;$i-lt$line.Length-3;$i++){
        if($line[$i] -ne $line[$i+1] -and $line[$i] -ne $line[$i+2] -and $line[$i] -ne $line[$i+3] -and $line[$i+1] -ne $line[$i+2] -and $line[$i+1] -ne $line[$i+3] -and $line[$i+2] -ne $line[$i+3]){
            [string]$temp = [string]$line[$i] + [string]$line[$i+1] + [string]$line[$i+2] + [string]$line[$i+3]
            Write-Host("Input: " + $line)
            Write-Host("Start found: " + $temp)
            $place = $i+4
            Write-Host([string]$place + " Characters read")
            $i = $line.Length
        }
    }
}