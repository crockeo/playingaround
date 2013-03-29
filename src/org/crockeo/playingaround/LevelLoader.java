package org.crockeo.playingaround;

import java.util.ArrayList;
import java.io.*;

public class LevelLoader {
	// Reading all lines from a file
	private String[] readLines(String path) {
		BufferedReader r;
		
		ArrayList<String> lines = new ArrayList<>();
		String line;
		
		try {
			r = new BufferedReader(new FileReader(new File(path)));
			
			while ((line = r.readLine()) != null)
				lines.add(line);
			
			r.close();
		} catch (IOException e) { return null; }
		
		return (String[])lines.toArray();
	}
	
	// Parse message prefix
	private boolean isMessage(String[] ss) { return ss[0].equals(Declares.MESSAGE_PREFIX) && ss.length == 2; }
	private String parseMessage(String[] ss) { return ss[1]; }
	
	// Parsing for a choice
	private boolean isChoice(String[] ss) { return ss[0].equals(Declares.MESSAGE_PREFIX) && ss.length == 2; } 
	private String parseChoice(String[] ss) { return ss[1]; }
	
	// Parsing for a sublevel
	private boolean isSubLevel(String[] ss) { return ss[0].equals(Declares.LEVEL_PREFIX) && ss.length == 2; } 
	private Level parseLevel(String[] ss) { if (ss[1] == "end") return null; else return loadLevel(ss[1]); }
	
	// Reading a level from a file	
	public Level loadLevel(String path) {
		String[] lines = readLines(path);
		if (lines == null) return null;
		
		String message = "";
		ArrayList<String> choices = new ArrayList<>();
		ArrayList<Level> sublevels = new ArrayList<>();
		
		for (String s: lines) {
			String[] ss = s.split(" ");
			
			if (isMessage(ss)) message = parseMessage(ss);
			else if (isChoice(ss)) choices.add(parseChoice(ss));
			else if (isSubLevel(ss)) sublevels.add(parseLevel(ss));
		}
		
		return new Level(message, (String[])choices.toArray(), (Level[])sublevels.toArray());
	}
	
	// Singleton
	private LevelLoader() { }
	
	public final Object clone() { return null; }
	
	private static LevelLoader instance;
	public static LevelLoader instance() {
		if (instance == null)
			instance = new LevelLoader();
		return instance;
	}
}
