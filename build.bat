for /R %%A in (*.md) do (
	pandoc.exe -f markdown+startnum-implicit_figures -t html5 --email-obfuscation=references --template="build/default.html5" -H "build/head.inc" -A "build/after.inc" -B "build/before.inc" -o "%%~dpnA.html" "%%A"
)
	pandoc.exe -f markdown+startnum-implicit_figures -t html5 --email-obfuscation=references --template="build/default.html5" -H "build/head.inc" -A "build/after.inc" -o "index.html" "index.md"
