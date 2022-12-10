#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/9/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 7 - Test Input.txt"

$table = @{}

for($i=0;$i-lt$data.Length;$i++){
    $line = [string]$data[$i]
    if($line[0]-eq"$"){
        if($line[2]-eq"c" -and $line[3]-eq"d"){
            Write-Host([string]$i + ":cd")
        }
        elseif($line[2]-eq"l" -and $line[3]-eq"s"){
            Write-Host([string]$i + ":ls")
        }
    }
    elseif($line[0]-eq"d" -and $line[1]-eq"i" -and $line[2]-eq"r"){
        Write-Host([string]$i + ":dir")
    }
    else{
        Write-Host([string]$i + ":file")
    }
}