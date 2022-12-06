#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/5/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 5 - Test Input.txt"

#read in crates as hashtable of strings

#$stacks = @{}
$stacks = @()

#I AM A CHEATER
$numStacks = Read-Host -Prompt "How many stack are their"
$tallestStack = Read-Host -Prompt "Whats the height of the tallest stack"

$count = 0

for($i=1;$i-le[int]$numStacks*3;$i+=4){
    $count++
    $tempArray = @()
    for($n=0;$n-lt[int]$tallestStack;$n++){
        if($data[$n][$i]-ne" "){
            $tempArray+=$data[$n][$i]
        }
    }
    $stacks+=,$tempArray
}

Write-Host($stacks)