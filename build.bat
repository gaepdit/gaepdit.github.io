cls
for /R %%A in (*.md) do (
	pandoc.exe -f markdown+startnum -t html5 --email-obfuscation=references --template="build/default.html5" -H "build/head.inc" -o "%%~dpnA.html" "%%A"
)
