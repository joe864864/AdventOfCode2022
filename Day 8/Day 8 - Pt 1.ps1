#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/9/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 8 - Input.txt"

$treesArray = @()

foreach($line in $data){
    $treesArray += $line
}

$visibleTrees = 0

#edge trees
$visibleTrees += ($treesArray.Length * 2) + (($treesArray[0].Length-2) * 2)

#Write-Host("Currnet length: " + [string]$visibleTrees)

#Runs through center area
for($i=1;$i-lt$treesArray.Length-1;$i++){
    for($n=1;$n-lt$treesArray[$i].Length-1;$n++){
        
        Write-Host("Current: " + $treesArray[$i][$n])
        
        #verify all numbers to each side are smaller if one is, stop, and +1
        #above
        $above = $true
        for($x=$i-1;$x-ge0;$x--){
            if($treesArray[$x][$n]-ge$treesArray[$i][$n] -and $above){
                $above = $false
                Write-Host("Above:Not Visible")
            }
            else{
                if($above){
                    Write-Host("Above:Visible")
                }
            }
        }
        #below
        $below = $true
        for($x=$i+1;$x-lt$treesArray.Length;$x++){
            if($treesArray[$x][$n]-ge$treesArray[$i][$n] -and $below){
                $below = $false
                Write-Host("Below:Not Visible")
            }
            else{
                if($below){
                    Write-Host("Below:Visible")
                }
            }
        }
        #left
        $left= $true
        for($x=$n-1;$x-ge0;$x--){
            if($treesArray[$i][$x]-ge$treesArray[$i][$n] -and $left){
                $left = $false
                Write-Host("Left:Not Visible")
            }
            else{
                if($left){
                    Write-Host("Left:Visible")
                }
            }
        }
        #right
        $right = $true
        for($x=$n+1;$x-lt$treesArray[$i].Length;$x++){
            if($treesArray[$i][$x]-ge$treesArray[$i][$n] -and $right){
                $right = $false
                Write-Host("Right:Not Visible")
            }
            else{
                if($right){
                    Write-Host("Right:Visible")
                }
            }
        }
        if($above -or $below -or $left -or $right){
            $visibleTrees++
        }
    }
}

Write-Host("Visible trees: " + $visibleTrees)