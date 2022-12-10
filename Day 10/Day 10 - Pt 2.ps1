#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/10/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 10 - Input.txt"

$x = @(1)

$line = 0
$count = 1

for($cycle=0;$cycle-lt240;$cycle++){
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

$row1 = @()
$row2 = @()
$row3 = @()
$row4 = @()
$row5 = @()
$row6 = @()

for($i=0;$i-lt$x.Length;$i++){
    if($i-ge0 -and $i-lt40){
        if($x[$i]-ge$i-1 -and $x[$i]-le$i+1){
            $row1 += "#"
        }
        else{
            $row1 += "."
        }
    }
    elseif($i-ge40 -and $i-lt80){
        if($x[$i]+40-ge$i-1 -and $x[$i]+40-le$i+1){
            $row2 += "#"
        }
        else{
            $row2 += "."
        }
    }
    elseif($i-ge80 -and $i-lt120){
        if($x[$i]+80-ge$i-1 -and $x[$i]+80-le$i+1){
            $row3 += "#"
        }
        else{
            $row3 += "."
        }
    }
    elseif($i-ge120 -and $i-lt160){
        if($x[$i]+120-ge$i-1 -and $x[$i]+120-le$i+1){
            $row4 += "#"
        }
        else{
            $row4 += "."
        }
    }
    elseif($i-ge160 -and $i-lt200){
        if($x[$i]+160-ge$i-1 -and $x[$i]+160-le$i+1){
            $row5 += "#"
        }
        else{
            $row5 += "."
        }
    }
    elseif($i-ge200 -and $i-lt240){
        if($x[$i]+200-ge$i-1 -and $x[$i]+200-le$i+1){
            $row6 += "#"
        }
        else{
            $row6 += "."
        }
    }
}

Write-Host($row1)
Write-Host($row2)
Write-Host($row3)
Write-Host($row4)
Write-Host($row5)
Write-Host($row6)