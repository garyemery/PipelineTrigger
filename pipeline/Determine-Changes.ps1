$changedFiles = $(git diff --name-only HEAD^ HEAD);

$sharedMatches = Select-String -InputObject $changedFiles -Pattern "PipelineTrigger.Shared" -AllMatches
$consoleMatches = Select-String -InputObject $changedFiles -Pattern "PipelineTrigger.Console" -AllMatches

$buildShared = $sharedMatches.Matches.Count -gt 0
$buildConsole = $consoleMatches.Matches.Count -gt 0

Write-Host "##vso[task.setvariable variable=outBuildConsole;isoutput=true]$buildConsole"
Write-Host "##vso[task.setvariable variable=outBuildShared;isoutput=true]$buildShared"