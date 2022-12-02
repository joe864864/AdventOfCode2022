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

$LargestCal = 0
$LargestPos = 0
$Elf = 0

foreach($i in $calorieTotals){
    if($i -gt $LargestCal){
        $LargestCal = $i
        $LargestPos = $Elf
    }
    elseif ($i -eq $LargestCal) {
        Write-Host("Duplicate Cal count")
    }
    $Elf++
}
Write-Host("Elf with the largest calorie count")
$LargestElf = $LargestPos + 1
Write-Host("Elf: " + $LargestElf)
Write-Host("Calories: " + $LargestCal)
