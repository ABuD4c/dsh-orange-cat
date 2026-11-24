@echo off
setlocal
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -c "import PySide6" 2>nul
  if errorlevel 1 (
    echo Installing PySide6...
    py -3 -m pip install -r requirements.txt
  )
  set DSH_ORANGE_CAT_ASSETS=%~dp0assets
  set DSH_ORANGE_CAT_USER_DATA=%LOCALAPPDATA%\dsh-orange-cat
  py -3 runtime\helper.py --preview
  exit /b %errorlevel%
)

where python >nul 2>nul
if %errorlevel%==0 (
  python -c "import PySide6" 2>nul
  if errorlevel 1 (
    echo Installing PySide6...
    python -m pip install -r requirements.txt
  )
  set DSH_ORANGE_CAT_ASSETS=%~dp0assets
  set DSH_ORANGE_CAT_USER_DATA=%LOCALAPPDATA%\dsh-orange-cat
  python runtime\helper.py --preview
  exit /b %errorlevel%
)

echo 未找到 Python。请安装 Python 3.11+ 并确保 py 或 python 在 PATH 中。
exit /b 1
