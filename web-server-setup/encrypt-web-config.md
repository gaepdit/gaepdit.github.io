# Encrypting web config files

Run the following on the server from an elevated command prompt as needed for each website.

```cmd
\Windows\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe -pef "connectionStrings" "D:\inetpub\wwwroot\geco.gaepd.org"

\Windows\Microsoft.NET\Framework\v4.0.30319\aspnet_regiis.exe -pef "appSettings" "D:\inetpub\wwwroot\geco.gaepd.org"
```
