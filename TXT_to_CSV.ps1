# Run Powershell as administrator, enter the following command:
# set-executionpolicy remotesigned

New-Item -Path ./ -Name CSV -ItemType Directory -ErrorAction Ignore

Get-ChildItem -Path ./*.txt | % {
    $fileName = ($_.Name).TrimEnd(".txt")
    (Get-Content -Encoding UTF8 $_).Replace("`t", ";").Replace("-1", "1") | Out-File -Encoding UTF8 -FilePath ./CSV/$fileName.csv -Force
}