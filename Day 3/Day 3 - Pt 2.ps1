#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/3/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 3 - Input.txt"

$sameType = @()

#Read in line data, 3 at a time
for($n=0; $n -lt $data.Length; $n+=3){

    Write-Host($n)
    Write-Host($data[$n])
    Write-Host($data[$n+1])
    Write-Host($data[$n+2])

    #temp holds matching values for current compartments
    $tempArray = @()

    #Arrays to hold each elfs bag contents
    $elf1 = @()
    $elf2 = @()
    $elf3 = @()

    #Build arrays
    for($i=0; $i -lt $data[$n].Length;$i++){
        $elf1 += $data[$n][$i]
    }
    for($i=0; $i -lt $data[$n+1].Length;$i++){
        $elf2 += $data[$n+1][$i]
    }
    for($i=0; $i -lt $data[$n+2].Length;$i++){
        $elf3 += $data[$n+2][$i]
    }

    #Collect matching chars for current elfs, exludes elf duplicates.
    foreach($c1 in $elf1){
        foreach($c2 in $elf2){
            foreach($c3 in $elf3){
                if($c1 -ceq $c2 -and $c2 -ceq $c3 -and $c1 -notin $tempArray){
                    $tempArray += $c1
                }
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