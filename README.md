How to use the jsf-richfaces-to-primefaces-migrator

Step 1:
-Open the Run Configurations for the Main.java of the migrator project

Step 2:
-Edit the program arguments
	-wcp (WebContentPath) is the webapp folder for the project you want to migrate. The migrator will use all xhtml files under this folder. Example:
		"L:\workspaces\workspace\project\src\main\webapp"
	-c (Configurations) is the specific application.conf file you want the migrator to use. Example:
		"C:/Users/User/git/jsf-richfaces-to-primefaces-migrator/src/main/resources/application.conf"
	-wtp (WebTargetPath) is the folder you would like the migrated files to be saved in. As long as the WebTargetPath remains the same and the names of xhtmls do not change 	migrated results will be overwritten upon repeated application of the migrator.
	
	If no -wtp is set in the program arguments, the migrator will copy the xhtmls into the -wcp folder, apply the migration to the original file
	and save the old xhtml files under the name convention "[oldFileBackupPrefix][xhtmlName].xhtml". This process does not allow the migrator to 	be 	used repeatedly, as it would apply to the already migrated xhtml code.
	
	If a -wtp is set in the program arguments, the migrator will create a copy of the xhtml in the -wtp folder and apply the migration on the 	copy, leaving the original untouched. This allows for the migrator to be applied repeatedly as it applies itself on a copy of the original 	xhtml code.
	
Step 3:
-Edit the application configurations.
-Open the application.conf file you would like to use. Make sure it has the following configurations.
 	webContentPath="", (String directory path. Overwrites the -wcp argument)
    webTargetPath="", (String directory path. Overwrites the -wtp argument)
    ignoredDirNames = ["sorttemplates", "generated", "resources", "WEB-INF"], (names of directories ignored when migrating xhtmls)
    recursive=true, (Boolean Controls whether files contained in directories who themselves are contained inside the -wcp directory should be migrated)
    notMigratedOnly=true, (Boolean Controls whether already migrated xhtmls should be migrated again. Only applies if no -wtp argument is applied)
    oldFileBackupPrefix="old_" (String prefix applied to the copies of the original xhtml code if no -wtp argument is applied)
    
    
    
    
Step 4:
-Use the migrator
-Open the Main.java of the migrator and click "Run main"