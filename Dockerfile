FROM: windows-latest
RUN Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
RUN Expand-Archive ngrok.zip
RUN .\ngrok\ngrok.exe authtoken $Env:NGROK_AUTH_TOKEN
ENV NGROK_AUTH_TOKEN: 25sI7GfUcZElfpjYpkvd6oafvm6_3FegQMwXtfNdYkHvoeF1N
RUN Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
RUN Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
RUN Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
RUN Set-LocalUser -Name "runneradmin" -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
RUN .\ngrok\ngrok.exe tcp 3389
