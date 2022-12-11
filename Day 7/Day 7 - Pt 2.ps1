#Advent of Code 2022
#Date: 12/10/2022

#Read through all the data and computer total calorie by elf
$data = Get-Content "Day 7 - Input.txt"

#Helper that returns the parent path of a given folder
function UpDir {
    param([string]$dir)
    $dir = $dir.Substring(0,$dir.LastIndexOf('/'))
    return ($dir -eq '') ? '/' : $dir
}

#Parse the file structure into a hashtable where each absolute
#Folder path is a key and its value is the total size of its children
$fileSys = @{}
switch -Regex ($data) {

    #Change directory
    '\$ cd (\S+)' {
        if ($matches[1] -eq '/') {
            $curDir = '/'
        }
        elseif ($matches[1] -eq '..') {
            $curDir = UpDir $curDir
        }
        else {
            $curDir += ($curDir -eq '/') ? $matches[1] : "/$($matches[1])"
        }

        #Add the current dir to the hashtable if it doesn't exist
        if ($null -eq $fileSys[$curDir]) {
            $fileSys[$curDir] = 0
        }
    }

    #File
    '(\d+) (\S+)' {

        #Add the file size to the current directory
        $fileSys[$curDir] += [int]$matches[1]

        #Add it to all of the parent directories as well
        $tempDir = $curDir
        while ($tempDir -ne '/') {
            $tempDir = UpDir $tempDir
            $fileSys[$tempDir] += [int]$matches[1]
        }
    }

}

Write-Host("Dir size: ")
$usedSpace = $fileSys['/']
$needed = 30000000 - (70000000 - $usedSpace)
$fileSys.GetEnumerator()
| Where-Object { $_.Value -ge $needed }
| Sort-Object Value
| Select-Object -First 1 -Expand Value
