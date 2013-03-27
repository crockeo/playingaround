package org.crockeo.playingaround;

import java.util.ArrayList;
import java.io.*;

public class LevelLoader {
	public static Level loadLevel(String path) {
		BufferedReader r;
		
		String message = "";
		ArrayList<String> choices = new ArrayList<>();
		ArrayList<Level> sublevels = new ArrayList<>();
		
		try {
			r = new BufferedReader(new FileReader(new File(path)));
			
			String line;
			String[] sline;
			
			while ((line = r.readLine()) != null) {
				sline = line.split(" ");
				if (sline.length != 2)
					continue;
				
				if (sline[0] == Declares.MESSAGE_PREFIX)
					message = sline[1];
				else if (sline[0] == Declares.CHOICE_PREFIX)
					choices.add(sline[1]);
				else if (sline[0] == Declares.LEVEL_PREFIX)
					sublevels.add(loadLevel(sline[1]));
			}
			
			r.close();
		} catch (IOException e) { e.printStackTrace(); return null; }
		
		if (message == "" || choices.size() == 0 || sublevels.size() == 0) return null;	
		return new Level(message, (String[])choices.toArray(), (Level[])sublevels.toArray());
	}
}
