@echo off

:: �������w��̏ꍇ�͏I��
if "%~1"=="" (
  echo ERROR: ����1���w�肳��Ă��܂���B
  echo USAGE: %~0 �v���Z�b�g�� [�㏑�����b�Z�[�W]
  exit /b 1
)

cd /d %~dp0

powershell scripts\post_message.ps1 %~1 %~2

exit /b 0
