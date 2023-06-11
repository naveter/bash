@echo off

echo "Start running programs..."

echo "Start RealSync..."
start "realsync" "C:\Program Files (x86)\dklab_realsync\realsync.exe" C:\work\new.topshop.local
timeout 2

echo "Start svn-view-curent-branch..."
start "svn-view-curent-branch" "C:\Users\ilya.gulevskiy\Desktop\svn-view-curent-branch.1.1.0.5.exe"
timeout 2

echo "Start VLC..."
start "vlc" "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
timeout 3

echo "Start WinAmp..."
start "WinAmp" "C:\Users\ilya.gulevskiy\Dropbox\msc\radio\WinampPlayList.m3u8"
timeout 3

echo "Start Firefox..."
start "firefox" "C:\Program Files (x86)\Mozilla Firefox 33\firefox.exe"
timeout 7

echo "Start Chrome..."
start "chrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
timeout 5

echo "Start Notepad++..."
start "notepad++" "C:\Program Files (x86)\Notepad++\notepad++.exe"
timeout 4

echo "Start PgManager..."
start "PgManager" "C:\Program Files (x86)\EMS\SQL Manager for PostgreSQL\PgManager.exe"
timeout 8

echo "Start Outlook"
start "Outlook" "C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE"
timeout 12

REM echo "Start NetBeans Java..."
REM start "netbeans" "C:\Program Files\NetBeans 8.1\bin\netbeans64.exe"  --locale en:US

echo "Start NetBeans PHP..."
start "netbeans" "C:\Program Files\NetBeans 8.2\bin\netbeans64.exe" --locale en:US --userdir C:\Users\ilya.gulevskiy\AppData\Local\NetBeansJava --cachedir C:\Users\ilya.gulevskiy\AppData\Local\NetBeansJava\cache

echo "I am ended."

exit