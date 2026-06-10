@echo off
title Assessment Architect - Launcher
cd /d "C:\Users\HP\Downloads\Sunil - Assessment Creator\Sunil - Assessment Creator"

echo ============================================================
echo   ASSESSMENT ARCHITECT - starting up...
echo ============================================================
echo.
echo [1/2] Starting the app...
start "Assessment App" "C:\Program Files\Python314\python.exe" -m streamlit run app.py --server.headless true --server.port 8501

echo     Waiting for the app to be ready...
timeout /t 10 /nobreak >nul

echo.
echo [2/2] Creating your public link (Cloudflare tunnel)...
echo.
echo ============================================================
echo   YOUR SHAREABLE LINK appears below - look for the line
echo   ending in   trycloudflare.com
echo   (Open that link in any browser, on any computer.)
echo.
echo   Keep THIS window open while you use the tool.
echo   Closing it stops the link.
echo ============================================================
echo.
"C:\Users\HP\cloudflared.exe" tunnel --url http://localhost:8501 --no-autoupdate

pause
