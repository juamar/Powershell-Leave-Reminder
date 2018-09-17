$scriptBlock = {
    Add-Type -AssemblyName System.Windows.Forms

    [System.Windows.Forms.MessageBox]::Show('It `s 6 PM. Complete the Jira and leave now!', 'Time to leave', 'Ok', 'Warning')
}

Start-Job $scriptBlock | Out-Null

$spaces = 0

while (Get-Job -State "Running")
{
    $spaceString = ""

    for ($i=0; $i -lt $spaces; $i++)
    {
        $spaceString = $spaceString + " "
    }

    echo $spaceString'Go home!'
    $spaces = $spaces + 4
    Start-Sleep -Milliseconds 100
}