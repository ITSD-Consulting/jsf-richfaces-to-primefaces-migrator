package pl.edu.pw.ii.migration;


import com.typesafe.config.Config;

import java.util.*;

public class AppConfig {
    static boolean notMigratedOnly;
    static boolean recursive;
    static boolean preserveSourceFile;
    static Set<String> ignoredDirNames = new HashSet<>();
    static String webContentPath;
    static String webTargetPath;
    static String oldFileBackupPrefix;
    static Map<String, String> stringsToReplace = new HashMap<>();

    static {
        stringsToReplace.put("xmlns:a4j=\"http://richfaces.org/a4j\"", "xmlns:p=\"http://primefaces.org/ui\"");
        stringsToReplace.put("xmlns:a=\"http://richfaces.org/a4j\"", "xmlns:p=\"http://primefaces.org/ui\"");
        stringsToReplace.put("xmlns:rich=\"http://richfaces.org/rich\"", "xmlns:pe=\"http://primefaces.org/ui/extensions\"");
    }

    public static void read(Config conf) {
        webContentPath = conf.getString("migrator.webContentPath");
        webTargetPath = conf.getString("migrator.webTargetPath");
        ignoredDirNames.addAll(conf.getStringList("migrator.ignoredDirNames"));

        recursive = conf.getBoolean("migrator.recursive");
        notMigratedOnly = conf.getBoolean("migrator.notMigratedOnly");
        preserveSourceFile=conf.getBoolean("migrator.preserveSourceFile");
        oldFileBackupPrefix=conf.getString("migrator.oldFileBackupPrefix");

        System.out.println("Web content path: " + conf.getString("migrator.webContentPath"));
    }
}
