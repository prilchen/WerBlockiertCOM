Wer blockiert meinen COM-Port?
Ein kleines Hilfsmittel für die Arduino IDE (Integrated Development Environment – zu Deutsch: integrierte Entwicklungsumgebung), um herauszufinden, welches Programm den seriellen Anschluss (COM-Port / Communication Port) blockiert.

Das Problem
Jeder Bastler kennt es: Man möchte einen neuen Code auf seinen Arduino oder ESP hochladen, aber die Entwicklungsumgebung meldet, dass der COM-Port gesperrt ist. Oft ist ein anderes Programm im Hintergrund schuld, wie zum Beispiel ein Slicer für den 3D-Drucker oder ein vergessenes Terminal-Fenster.

Die Lösung
Dieses Skript sucht nach dem Übeltäter, der den Kommunikationsanschluss blockiert.

Wie funktioniert das?
Das Skript lädt sich automatisch ein offizielles und sicheres Werkzeug namens handle.exe von Microsoft (genauer gesagt von den "Sysinternals", einer bewährten Sammlung von Werkzeugen für Windows) herunter. Damit durchsucht es das System nach Programmen, die gerade auf serielle Verbindungen zugreifen, und zeigt dir den Namen des blockierenden Programms an.

Anleitung
Lade die beiden Dateien WerBlockiertCOM.bat und WerBlockiertCOM.ps1 herunter und speichere sie im selben Ordner.

Mache einen Doppelklick auf die Datei WerBlockiertCOM.bat.

Das Skript fragt nach Administratorrechten (diese sind nötig, um alle laufenden Programme untersuchen zu können).

Ein schwarzes Fenster öffnet sich und zeigt dir an, welches Programm den COM-Port gerade besetzt hält.

Haftungsausschluss
Die Nutzung geschieht auf eigene Gefahr. Das Skript lädt lediglich ein offizielles Microsoft-Werkzeug herunter und führt einen Suchlauf durch. Es werden keine Programme automatisch oder ungefragt beendet.
