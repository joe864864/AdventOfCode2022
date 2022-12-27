#Advent of Code 2022
#Author: Joseph Scott
#Date: 12/16/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 11 - Test Input.txt"

$monkeys = @()

for($i=0;$i-lt$data.Length;$i+=7){

    #Get monkey Number
    $line = $data[$i] -split {$PSItem -eq ' ' -or $PSItem -eq ':'}
    $monkeyNum = [int]$line[1]

    #Starting items in to array
    $startArray = @()
    $temp = $data[$i+1] -replace ' '
    $temp = $temp -split {$PSItem -eq ':' -or $PSItem -eq ','}
    for($n=1;$n-lt$temp.Length;$n++){
        $startArray += [int]$temp[$n]
    }

    #Operation
    $operation = @()
    $temp = $data[$i+2] -split {$PSItem -eq ':' -or $PSItem -eq '='}
    $temp = $temp -split {$PSItem -eq ' '}
    for($n=7;$n-lt$temp.Length;$n++){
        $operation += $temp[$n]
    }

    #Test
    $line = $data[$i+3] -split {$PSItem -eq ' '}
    $test = [int]$line[5]

    #If True
    $line = $data[$i+4] -split {$PSItem -eq ' '}
    $trueMon = [int]$line[9]

    #If False
    $line = $data[$i+5] -split {$PSItem -eq ' '}
    $falesMon = [int]$line[9]


    $tempObject = [PSCustomObject]@{
        Number = $monkeyNum
        Start = $startArray
        Operation  = $operation
        Test = $test
        True = $trueMon
        False = $falesMon
    }

    $monkeys += $tempObject
}

Write-Host("Input Complete")

$itemsInspected = @()

for($i=0;$i-lt$monkeys.Length;$i++){
    $itemsInspected+=0
}

for($i=0;$i-lt10000;$i++){
    Write-Host("Round: " + $i)
    foreach($monkey in $monkeys){
        for($n=0;$n-lt$monkey.Start.Length;$n++){
            if($monkey.Start[$n] -ne 0){
                #Increase items inspected
                $itemsInspected[$monkey.Number]++

                #Set initial worry from item
                [bigint]$worry = $monkey.Start[$n]
                #Complete operation
                if($monkey.Operation[2]-eq "old"){
                    $worry *= $worry
                }
                elseif($monkey.Operation[1]-eq "*"){
                    $worry = $worry * [bigint]$monkey.Operation[2]
                }
                elseif($monkey.Operation[1]-eq "+"){
                    $worry = $worry + [bigint]$monkey.Operation[2]
                }
                #Lower Level
                #$worry = [math]::floor($worry / 3)

                #Test Operation and throw to monkey
                $to = $null
                if($worry%$monkey.Test -eq 0){
                    $to = $monkey.True
                }
                else{
                    $to = $monkey.False
                }

                #Throw to other monkey
                $monkeys[$to].Start += $worry
                #Remove from current monkey
                $monkey.Start[$n] = 0
            }
        }
    }
}

# Sort the array in descending order
$sortedItemsInspected = $itemsInspected | Sort-Object -Descending

# Take the first two elements of the sorted array
$highestTwo = $sortedItemsInspected[0..1]

# Return the product of the two highest values
Write-Host($highestTwo[0] * $highestTwo[1])