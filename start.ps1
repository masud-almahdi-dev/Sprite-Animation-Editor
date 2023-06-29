$Folder = '.py_env'
$DefaultFilename = 'start.py'

if($args[0].Count -eq 0){
    $Filename = $DefaultFilename
}

if (Test-Path -Path $Folder) {
    if(Test-Path -Path '.vscode'){
    }else{
        New-Item '.vscode' -ItemType directory | Out-Null
        '{"python.autoComplete.extraPaths":["'+$Folder+'"],"python.defaultInterpreterPath": "./'+$Folder+'/Scripts/python.exe","python.analysis.extraPaths": ["'+$Folder+'"]}' | Out-File -FilePath ".\.vscode\settings.json" -Encoding "UTF8"
    }
    & "$Folder\scripts\activate";
    & "$Folder/scripts/python.exe" -u "`"$PSScriptRoot\$Filename`""
} else {
    New-Item '.vscode' -ItemType directory | Out-Null
    '{"python.autoComplete.extraPaths":["'+$Folder+'"],"python.defaultInterpreterPath": "./'+$Folder+'/Scripts/python.exe","python.analysis.extraPaths": ["'+$Folder+'"]}' | Out-File -FilePath ".\.vscode\settings.json" -Encoding "UTF8"
    py -3 -m venv $Folder
    & "$Folder\scripts\activate"
    & "$Folder/scripts/python.exe" -m pip install --upgrade pip
    & pip install pygame --pre
    & "$Folder/scripts/python.exe" -u "`"$PSScriptRoot\$Filename`""
}