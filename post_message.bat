@echo off

:: 引数未指定の場合は終了
if "%~1"=="" (
  echo ERROR: 引数1が指定されていません。
  echo USAGE: %~0 プリセット名 [上書きメッセージ]
  exit /b 1
)

cd /d %~dp0

powershell scripts\post_message.ps1 %~1 %~2

exit /b 0
