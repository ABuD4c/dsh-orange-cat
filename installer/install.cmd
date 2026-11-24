@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 正在安装橘猫桌宠，请稍候...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
echo.
if errorlevel 1 (
  echo 安装没有完成。请看上面的说明。
) else (
  echo 安装结束。
)
pause
