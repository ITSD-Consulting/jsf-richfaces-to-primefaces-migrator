# jsf-richfaces-to-primefaces-migrator

Was benötige ich um den Migrator zu testen?
Schritt 1:
	-jsf-richfaces-to-primefaces-migrator muss im Workspace vorhanden sein
	-Projekt: migration-richfaces-source aus dem CVS holen
	-Projekt: migration-primefaces-targez aus dem CVS holen
	
	
Schritt 2:
	-In den Run Configurations, Java-Applikations für die Main Methode des Migrators unter "program arguments" die arguments anpassen.
	das -wcp argument gibt hierbei den webapp Ordner des Projektes an aus welchem die xhtmls mirgiert werden sollen, und das -c argument 
	den Ort der application.conf Datei des Migrators
	Bsp:
	-wcp L:\workspaces\liferay_bem_head\migration-richfaces-source\src\main\webapp
	-c "C:/Users/Benutzer/git/jsf-richfaces-to-primefaces-migrator/src/main/resources/application.conf"
	

Schritt 3:
	-migration-richfaces-source Projekt auf dem Server deployen und eine entsprechende Seite an der Benutzeroberfläche erstellen
	-migration-primefaces-target Projekt auf dem Server deployen und eine entsprechende Seite an der Benutzeroberfläche erstellen
	(-Sicherstellen, dass die views der beiden Projekte richtig dargestellt werden. Evtl. kleine Änderungen vornehmen und sehen ob diese
	nach einem refresh angezeigt werden)
	
Wie verwende ich den Migrator?
Schritt 1:
	-Wähle eine oder mehrere xhtml-Dateien aus, die du migrieren möchtest. Dies tust du durch anpassen des -wcp arguments in den Run configurations der Main 
	Methode des Migrators
	
Schritt 2:
	-Lass die Main Methode laufen und führe einen refresh auf den Ordner aus, der die xhtml enthält. Die Anzahl an xhtmls sollte sich verdoppelt 
	haben wobei die eine hälfte die bezeichung "old_X.xhtml" trägt, wobei X der ursprüngliche name einer xhtml datei ist.
	-Die Xhtml-Dateien mit der Bezeichnung "old_X.xhtml" enthalten den alten RIchfaces Xhtml code, wobei die Dateien mit der Bezeichnung
	 X.xhtml den migrierten Primefaces code enthalten.
	
(Schritt 3: Nur Notwendig beim testen des Migrators mithilfe der migration-richfaces-source und migration-primefaces-target Projekte)
	-Kopiere den Migrierten Primefaces Xhtml.Code oder die X.xhtml Dateien des migration-richfaces-source in das 
	migration-primefaces-target Projekt und überschreibe die bestehenden Xhtmls.
	-Lösche die Migrierten Primefaces Xhtmls die sich noch im migration-richfaces-source Projekt befinden und benenne die "old_X.xhtml" 	
	Dateien um, sodass sie erneut die Bezeichnung "X.Xhtml" tragen. Dies stellt sicher, dass der Migrator erneut ohne Probleme ausgeführt werden kann.
	-WICHTIG! Damit der Migrator erneut ausgeführt werden kann dürfen sich keine Dateien mit der Bezeichnung "old_X.xhtml" in dem -wcp Ordner befinden