#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/4/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 4 - Input.txt"

$pairs = @()

foreach($line in $data){
    $temp = $line.Split(",").Split("-")
    foreach($num in $temp){
        $pairs += [int]$num
    }
    #Write-Host($pairs)
}

$numDupes = 0

#Check for any complete overlaps
for($i=0;$i -lt $pairs.Length;$i+=4){
    Write-Host([String]$pairs[$i] + "-" + [String]$pairs[$i+1] + "," + [String]$pairs[$i+2] + "-" + [String]$pairs[$i+3])
    if($pairs[$i] -ge $pairs[$i+2] -and $pairs[$i+1] -le $pairs[$i+3]){
        $numDupes++
    }
    elseif($pairs[$i+2] -ge $pairs[$i] -and $pairs[$i+3] -le $pairs[$i+1]){
        $numDupes++
    }
}

Write-Host("Total duplicates: " + $numDupes)