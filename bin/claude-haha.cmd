@echo off
setlocal enabledelayedexpansion

:: Get the directory where this script is located (includes trailing backslash)
set "SCRIPT_DIR=%~dp0"
:: Go up one level from bin\ to project root
set "ROOT_DIR=%SCRIPT_DIR%.."

:: Get current working directory
set "CALLER_DIR=%CD%"

:: Change to root directory
cd /d "%ROOT_DIR%"

:: Use absolute path for bun to avoid module resolution issues
set "CLI_SCRIPT=%ROOT_DIR%\src\entrypoints\cli.tsx"
set "RECOVERY_SCRIPT=%ROOT_DIR%\src\localRecoveryCli.ts"

:: Check if CLAUDE_CODE_FORCE_RECOVERY_CLI is set to 1
if "%CLAUDE_CODE_FORCE_RECOVERY_CLI%"=="1" (
    bun --env-file=.env "%RECOVERY_SCRIPT%" %*
) else (
    bun --env-file=.env "%CLI_SCRIPT%" %*
)
