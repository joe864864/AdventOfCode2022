#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/10/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 9 - Test Input.txt"

$commands = @()

for($i=0;$i-lt$data.Length;$i++){
    $commands += ,$data[$i].split(" ")
}

$height = 0
$width = 0

foreach($command in $commands){
    if($command[0]-eq"U"){
        $height += $command[1]
    }
    elseif($command[0]-eq"D"){
        $height -= $command[1]
    }
    elseif($command[0]-eq"L"){
        $width -= $command[1]
    }
    elseif($command[0]-eq"R"){
        $width += $command[1]
    }
}

Write-Host("Height: " + $height)
Write-Host("Width: " + $width)