#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/9/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 6 - Input.txt"

foreach($line in $data){
    for($i=0;$i-lt$line.Length-13;$i++){
        $currentArray = @()
        for($n=$i;$n-lt$i+14;$n++){
            $currentArray += $line[$n]
        }
        #Write-Host("Array: " + $currentArray)
        $match = $false

        for($n=0;$n-lt$currentArray.Length;$n++){
            for($x=0;$x-lt$currentArray.Length;$x++){
                if($n-eq$x){

                }
                else{
                    if($currentArray[$n]-eq$currentArray[$x]){
                        $n = $currentArray.Length
                        $x = $currentArray.Length
                        $match = $true
                    }
                }
            }
        }
        if(!$match){
            Write-Host("Found message start: " + $currentArray)
            $place = $i+14
            Write-Host([string]$place + " Characters read")
            $i = $line.Length
        }
    }
}