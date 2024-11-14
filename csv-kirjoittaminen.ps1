$data = @(
    [PSCustomObject]@{ Name = "Alice"; Age = 30; Occupation = "Engineer" }
    [PSCustomObject]@{ Name = "Bob"; Age = 25; Occupation = "Designer" }
    [PSCustomObject]@{ Name = "Charlie"; Age = 35; Occupation = "Manager" }
)

$filePath = "C:\Temp\output.csv"
$data | Export-Csv -Path $filePath -NoTypeInformation -Force
