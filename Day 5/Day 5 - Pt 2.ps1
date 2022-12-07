#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/6/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 5 - Test Input.txt"

#read in crates as hashtable of strings

$stacksArray = @()

#I AM A CHEATER
$numStacks = Read-Host -Prompt "How many stack are their"
$tallestStack = Read-Host -Prompt "Whats the height of the tallest stack"

$count = 0

#reads in crates in to stacksarray
for($i=1;$i-le[int]$numStacks*4;$i+=4){
    $count++
    $tempArray = @()
    for($n=0;$n-lt[int]$tallestStack;$n++){
        if($data[$n][$i]-ne" "){
            $tempArray+=$data[$n][$i]
        }
    }
    [array]::reverse($tempArray)
    $stacksArray+=,$tempArray
}

#Calulates total number of crates and fills numStackArray that holds how many crates are in each stack
$totalCrates = 0
$numStacksArray = @()

foreach($stack in $stacksArray){
    $numStacksArray += $stack.Length
    $totalCrates += $stack.Length
}
Write-Host("Total crates: " + $totalCrates)

#Fills empty spots above current crates in stacksarray
for($i=0;$i -lt $stacksArray.Length;$i++){
    while($stacksArray[$i].Length -ne $totalCrates){
        $stacksArray[$i] += ""
    }
}

#Loops through instructions
foreach($line in $data){

    Write-Host("Current stacksArray:")
    $i=0
    foreach($line2 in $stacksArray){
        $i++
        Write-Host([string]$i + ":" + $numStacksArray[$i-1] + ":" + $line2)
    }

    #handles movemnet of creates
    if($line[0] -eq "m"){
        $tempArray = $line.split(" ")

        #for($i=[int]$tempArray[1];$i-gt0;$i--){
        for($i=0;$i-lt$tempArray[1];$i++){
            #$stacksArray[$tempArray[5]-1][$numStacksArray[$tempArray[5]-1]] = $stacksArray[$tempArray[3]-1][$numStacksArray[$tempArray[3]-1]-1]
            $stacksArray[$tempArray[5]-1][$numStacksArray[$tempArray[5]-1]+(([int]$tempArray[1]-1)-$i)] = $stacksArray[$tempArray[3]-1][$numStacksArray[$tempArray[3]-1]-1]
            $stacksArray[$tempArray[3]-1][$numStacksArray[$tempArray[3]-1]-1] = ""
            $numStacksArray[$tempArray[5]-1] += 1
            $numStacksArray[$tempArray[3]-1] -= 1
        }
    }
}

#Print final board
Write-Host("Current stacksArray:")
$i=0
foreach($line in $stacksArray){
    $i++
    Write-Host([string]$i + ":" + $numStacksArray[$i-1] + ":" + $line)
}

#Print Solution
$i=0
Write-Host("Solution: ") -NoNewline
foreach($line in $stacksArray){
    Write-Host($line[$numStacksArray[$i]-1]) -NoNewline
    $i++
}
Write-Host("")