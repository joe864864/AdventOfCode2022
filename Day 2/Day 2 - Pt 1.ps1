#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/2/2022

#Read through all the data and computer total calorie by elf
$strat = Get-Content "Day 2 - Input.txt"

<#
A Rock X 1
B Paper Y 2
C Scissors Z 3
#>

$MyPoints = 0

foreach($i in $strat){
    $actions = $i.split(" ", 2)
    if($actions[0] -eq 'A'){
        #Draw
        if($actions[1] -eq 'X'){
            $MyPoints += 1 + 3
        }
        #Win
        elseif($actions[1] -eq 'Y'){
            $MyPoints += 2 + 6
        }
        #Loss
        elseif($actions[1] -eq 'Z'){
            $MyPoints += 3 + 0
        }
    }
    elseif($actions[0] -eq 'B'){
        #Loss
        if($actions[1] -eq 'X'){
            $MyPoints += 1 + 0
        }
        #draw
        elseif($actions[1] -eq 'Y'){
            $MyPoints += 2 + 3
        }
        #Win
        elseif($actions[1] -eq 'Z'){
            $MyPoints += 3 + 6
        }
    }
    elseif($actions[0] -eq 'C'){
        #Win
        if($actions[1] -eq 'X'){
            $MyPoints += 1 + 6
        }
        #Loss
        elseif($actions[1] -eq 'Y'){
            $MyPoints += 2 + 0
        }
        #draw
        elseif($actions[1] -eq 'Z'){
            $MyPoints += 3 + 3
        }
    }
}

Write-Host("Points: " + $MyPoints)