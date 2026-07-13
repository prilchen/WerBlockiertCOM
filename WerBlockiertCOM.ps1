$handleExe = '.\handle.exe'

# Lade handle.exe herunter, falls nicht vorhanden
if (-not (Test-Path $handleExe)) {
    Write-Host 'Lade offizielles Analyse-Tool (handle.exe) von Microsoft Sysinternals herunter...' -ForegroundColor Yellow
    try {
        Invoke-WebRequest -Uri 'https://live.sysinternals.com/handle.exe' -OutFile $handleExe -UseBasicParsing
    } catch {
        Write-Host 'Fehler beim Download. Bitte Internetverbindung pruefen.' -ForegroundColor Red
        exit
    }
}

Write-Host 'Akzeptiere EULA und suche nach seriellen Verbindungen...' -ForegroundColor Yellow
.\handle.exe -accepteula -nobanner > $null
Write-Host ''

# COM-Port Mapping aus der Registry auslesen
$portMap = @{}
try {
    $reg = Get-ItemProperty -Path 'HKLM:\HARDWARE\DEVICEMAP\SERIALCOMM' -ErrorAction Stop
    $reg.psobject.properties | Where-Object { $_.Name -like "\Device\*" } | ForEach-Object {
        $portMap[$_.Name] = $_.Value
    }
} catch {
    # Ignorieren, falls der Registry-Schluessel nicht existiert (z.B. keine Ports verbunden)
}

Write-Host 'Gefundene Prozesse:' -ForegroundColor Green

# handle.exe ausführen und nach typischen seriellen NT-Gerätenamen filtern
$found = .\handle.exe -a -nobanner \Device\ | Select-String -Pattern 'VCP|USBSER|Serial|Prolific|CH341|Silabser|COM\d+'

if ($found) {
    $found | ForEach-Object {
        $line = $_.Line
        $matched = $false
        
        # Prüfen, ob eine bekannte NT-Geräte-Bezeichnung (wie \Device\VCP0) in der Zeile vorkommt
        foreach ($ntName in $portMap.Keys) {
            if ($line -match [regex]::Escape($ntName)) {
                $comName = $portMap[$ntName]
                # Ersetze z.B. "\Device\VCP0" durch "\Device\VCP0 [=> COM17]"
                $line = $line -replace [regex]::Escape($ntName), "$ntName [=> $comName]"
                $matched = $true
                break
            }
        }
        
        # Falls es eine serielle Verbindung ist, die nicht in der Registry steht (selten)
        if (-not $matched) {
            $line = $line + "  [COM-Port unbekannt]"
        }
        
        Write-Host $line
    }
} else {
    Write-Host 'Aktuell haelt kein Prozess einen COM-Port blockiert.' -ForegroundColor Cyan
}
