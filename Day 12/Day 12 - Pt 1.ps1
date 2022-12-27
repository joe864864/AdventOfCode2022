#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/17/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 12 - Test Input.txt"

$map = @()

foreach($line in $data){
    $map += ,$line
}

Write-Host("")