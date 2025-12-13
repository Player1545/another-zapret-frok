@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service.bat status_zapret
call service.bat check_updates
call service.bat load_game_filter
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"
cd /d %BIN%

start "zapret: %~n0" /min "%BIN%winws.exe" --debug=0 --wf-tcp=80,443,2053,2083,2087,2096,8443,%GameFilter% --wf-udp=443,19294-19344,50000-50100,%GameFilter% ^
--filter-udp=443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --domcase --methodeol --synack-split=acksyn --dpi-desync=rstack,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=5 --dpi-desync-fake-tls-mod=padencap,rndsni --new ^
--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --methodeol --synack-split=acksyn --domcase --dpi-desync=fake,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=7 --new ^
--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --methodeol --synack-split=acksyn --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%LISTS%list-google.txt" --ip-id=zero --methodeol --synack-split=acksyn --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-tcp=80,443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=443 --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=rstack,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=5 --dpi-desync-fake-tls-mod=padencap,rndsni --new ^
--filter-tcp=80,443,%GameFilter% --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=%GameFilter% --ipset="%LISTS%ipset-all.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=fake,tamper --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --new ^
--filter-udp=443 --hostlist-auto="%LISTS%list-auto.txt" --hostlist-auto-fail-threshold=2 --hostlist-auto-fail-time=60 --hostlist-auto-retrans-threshold=2 --hostlist-auto-debug="%BIN%list-auto-logs.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=rstack,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=5 --new ^
--filter-udp=443 --hostlist="%LISTS%list-telegram.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=rstack,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=5 --dpi-desync-fake-tls-mod=padencap,rndsni --new ^
--filter-tcp=80,443 --hostlist="%LISTS%list-telegram.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=443 --ipset="%LISTS%ipset-telegram.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=rstack,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=5 --dpi-desync-fake-tls-mod=padencap,rndsni --new ^
--filter-tcp=80,443,%GameFilter% --ipset="%LISTS%ipset-telegram.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=590-1400,3478,32000-32010,49224,50000-50100 --filter-l7=stun --ipset="%LISTS%ipset-telegram.txt" --synack-split=acksyn --methodeol --domcase --dpi-desync=fake,tamper --dpi-desync-repeats=11 --dpi-desync-ttl=7 --dpi-desync-fake-tls-mod=padencap,rndsni