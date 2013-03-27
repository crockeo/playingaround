package org.crockeo.playingaround;

import java.io.File;

public class FileUtils {
	// Checking if a file exists
	public static boolean fileExists(String name) { return new File(name).exists(); }
}
