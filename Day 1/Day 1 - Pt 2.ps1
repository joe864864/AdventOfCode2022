#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/1/2022

#Read through all the data and computer total calorie by elf
$calorie_data = Get-Content "Day 1 - Input.txt"

#Write-Host($calorie_data.Length)

$total = 0
$calorieTotals = @()

foreach($i in $calorie_data){

    if($i -eq ""){
        #Write-Host("Space")

        $calorieTotals += $total
        $total = 0
    }
    else{
        #Write-Host($i)
        $total = $total + [int]$i
    }

}

#Write-Host($calorieTotals)

#Compute elf with the largest calorie count

#Cal then elf
$top = @(-1,-1,-1,-1,-1,-1)
$Elf = 0

foreach($i in $calorieTotals){
    if($i -gt $top[0]){
        $top[2] = $top[0]
        $top[3] = $top[1]
        $top[0] = $i
        $top[1] = $Elf
    }
    elseif($i -gt $top[2]){
        $top[4] = $top[2]
        $top[5] = $top[3]
        $top[2] = $i
        $top[3] = $Elf
    }
    elseif($i -gt $top[4]){
        $top[4] = $i
        $top[5] = $Elf
    }
    $Elf++
}

Write-Host($top)

$top3Cal = $top[0] + $top[2] + $top[4]

Write-Host("The top 3 elves are carrying " + $top3Cal + " calories.")
