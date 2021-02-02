Function repeatEcho (
     [string] $Text,
     [int] $Times
 ) {
     while ($Times -ne 0) {
         echo $Text
         $Times -= 1
     }
 }

Function InputString (
    [string] $Param,
    [string] $Default
) {
    $Inputs = Read-Host -Prompt $Param
    if ($Inputs -eq "") { $Inputs = $Default }
    return $Inputs
}

Function InputInt (
    [string] $Param,
    [string] $Default
) {
    [int]$Inputs = InputString $Param $Default
    return $Inputs
}

Function Fibo ( [int] $n ) {
    if ($n -eq 0 -or $n -eq 1) { return $n }
    return (Fibo ($n-1)) + (Fibo ($n-2))
}

$inp = InputInt "Write a number here > "
$fib = Fibo $inp
Write-Host "$inp th Fibonacci = $fib"

pause
