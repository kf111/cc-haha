@echo off
setlocal enabledelayedexpansion

:: Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR:~0,-1%"

:: Get current working directory
set "CALLER_DIR=%CD%"

:: Change to root directory
cd /d "%ROOT_DIR%"

:: Check if CLAUDE_CODE_FORCE_RECOVERY_CLI is set to 1
if "%CLAUDE_CODE_FORCE_RECOVERY_CLI%"=="1" (
    bun --env-file=.env ./src/localRecoveryCli.ts %*
) else (
    bun --env-file=.env ./src/entrypoints/cli.tsx %*
)
