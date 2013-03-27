package org.crockeo.playingaround;

import java.io.*;

public class Main {
	public Main(String path) { new Game().start(path); }
	
	// Loading the source level path from the config file
	private static String loadSourcePath(String configPath) {
		BufferedReader r;
		
		try {
			r = new BufferedReader(new FileReader(new File(configPath)));
			
			String ret = r.readLine();
			
			r.close();
			return ret;
		} catch (IOException e) { return null; }
	}
	
	////
	// Entrance point
	//
	public static void main(final String[] args) {
		if (args.length == 0) {
			String path = loadSourcePath(Declares.CONFIG_PATH);
			if (path == null || !FileUtils.fileExists(path)) System.exit(1);
			else if (FileUtils.fileExists(path)) new Main(path);
		} else if (args.length == 1) {
			new Main(args[1]);
		}
		else System.err.println("Proper usage: \"playingaround(.jar) <source level>\" OR \"playingaround(.jar)\" with " + Declares.CONFIG_PATH + " present.");
	}
}
