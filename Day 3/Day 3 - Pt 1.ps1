#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 3 - Input.txt"

$sameType = @()

#Read in line data
foreach($line in $data){

    #2 compartments
    $comp1 = @()
    $comp2 = @()

    #Split string in to 2 compartments
    for($n = 0; $n -lt $line.Length; $n++){
        if($n -lt $line.Length/2){
            $comp1 += $line[$n]
        }
        else{
            $comp2 += $line[$n]
        }
    }
    Write-Host("Line: " + $line)
    Write-Host("Comp 1: " + $comp1)
    Write-Host("Comp 2: " + $comp2)

    #temp holds matching values for current compartments
    $tempArray = @()

    #Collect matching chars for current compartments, exludes compartment duplicates.
    foreach($c1 in $comp1){
        foreach($c2 in $comp2){
            if($c1 -ceq $c2 -and $c1 -notin $tempArray){
                $tempArray += $c1
            }
        }
    }
    #Adds current compartment matches to total matches
    $sameType += $tempArray

}

Write-Host("Common letters:" + $sameType)
$sum = 0

#Computes total matches values using ascii values.
foreach($c in $sameType){
    if ($c -cmatch "[A-Z]"){
        #Write-Host(([int][char]$c) - 38)
        $sum += ([int][char]$c) - 38
    }
    else{
        #Write-Host(([int][char]$c) - 96)
        $sum += ([int][char]$c) - 96
    }
}

Write-Host("Sum: " + $sum)