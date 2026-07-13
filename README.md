# WerBlockiertCOM

Ein kleines Hilfsmittel für Windows, um herauszufinden, welches Programm den seriellen Anschluss blockiert. Besonders nützlich für Nutzer der Arduino IDE (Integrated Development Environment – zu Deutsch: integrierte Entwicklungsumgebung).

## Das Problem
Jeder Bastler kennt es: Man möchte einen neuen Code auf seinen Arduino oder ESP-Mikrocontroller hochladen, aber das System meldet, dass der COM-Port (Communication Port – Kommunikationsanschluss) gesperrt ist. Die Fehlermeldung verrät leider nicht, *welches* Programm im Hintergrund den Anschluss besetzt hält (zum Beispiel ein Slicer für den 3D-Drucker oder ein Terminal-Fenster).

## Die Lösung
Dieses Skript sucht nach dem Übeltäter. Es nutzt dafür ein etabliertes, offizielles Werkzeug von Microsoft zur Systemanalyse, um den blockierenden Prozess verlässlich auszulesen.

### Wie funktioniert das?
Das Skript lädt sich bei der ersten Ausführung automatisch die Datei `handle.exe` von den Microsoft Sysinternals herunter. *(Hinweis zu den Fakten: Dies ist ein nachweislich sicheres und offizielles Werkzeug der Firma Microsoft).* Damit durchsucht es das System nach Programmen, die gerade auf serielle Verbindungen zugreifen, und zeigt dir den Namen des blockierenden Programms direkt an.

## Anleitung (So wendest du es an)

1. Lade die beiden Dateien `WerBlockiertCOM.bat` und `WerBlockiertCOM.ps1` aus diesem Repository herunter.
2. Speichere beide Dateien im selben Ordner auf deinem Computer.
3. Mache einen Doppelklick auf die Datei `WerBlockiertCOM.bat`.
4. Das Skript fragt nach Administratorrechten. Diese sind zwingend nötig, um alle laufenden Programme tiefgreifend untersuchen zu können. Bestätige die Abfrage.
5. Ein schwarzes Konsolen-Fenster öffnet sich und zeigt dir an, welches Programm den COM-Port gerade besetzt hält.
6. Schließe das dort genannte Programm. Danach klappt der Upload in der Regel wieder fehlerfrei.

## Wichtiger Hinweis & Haftungsausschluss
Die Nutzung geschieht auf eigene Gefahr. Das Skript lädt lediglich das offizielle Microsoft-Werkzeug herunter und führt einen Suchlauf durch. Es beendet **keine** Programme automatisch oder ungefragt. Ob die Freigabe des Ports danach in jedem noch so speziellen Einzelfall funktioniert, kann nicht garantiert werden, in der Praxis ist es aber ein sehr verlässlicher Weg, den Übeltäter zu überführen.

## Lizenz
Der Programmcode (die Skripte) in diesem Projekt ist unter der offenen **GPLv3 (GNU General Public License Version 3)** veröffentlicht. Jeder darf den Code frei nutzen, verändern und weitergeben, solange dies unter denselben freien Bedingungen geschieht. 

Weitere nützliche Erklärungen und spannende Bastelprojekte findest du auf meinem Blog unter [prilchen.de](https://prilchen.de).
