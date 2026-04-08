# Get the directory where this script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RootDir = (Get-Item $ScriptDir).Parent.FullName

# Get current working directory
$CallerDir = (Get-Location).Path

# Change to root directory
Set-Location $RootDir

# Check if CLAUDE_CODE_FORCE_RECOVERY_CLI is set to 1
if ($env:CLAUDE_CODE_FORCE_RECOVERY_CLI -eq "1") {
    bun --env-file=.env ./src/localRecoveryCli.ts $args
} else {
    bun --env-file=.env ./src/entrypoints/cli.tsx $args
}
