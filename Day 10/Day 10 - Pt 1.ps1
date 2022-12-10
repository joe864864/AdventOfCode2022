#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/10/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 10 - Input.txt"

$x = @(1)

$line = 0
$count = 1

for($cycle=0;$cycle-lt220;$cycle++){
    $tempx = 0
    if($data[$line][0] -eq "a" -and $count-ne2){
        $count++
        $tempx = $x[$cycle]
    }
    elseif($data[$line][0] -eq "a" -and $count-eq2){
        $temp = $data[$line].split(" ")
        $tempx = $x[$cycle] + $temp[1]
        $count = 1
        $line++
    }
    else{
        $tempx = $x[$cycle]
        $line++
    }
    $x += $tempx
}

$sum = 0

For($i=20;$i-le220;$i+=40){
    Write-Host("Value at place " + $i + " is " + $x[$i-1] + "giving strength: " + $i*$x[$i-1])
    $sum += $i*$x[$i-1]
}

Write-Host("Sum: " + $sum)