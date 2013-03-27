package org.crockeo.playingaround;

public class Level {	
	private final String message;
	private final String[] choices;
	private final Level[] sublevels;
	
	public Level(String message, String[] choices, Level[] sublevels) {
		if (choices.length != sublevels.length) throw new IllegalArgumentException();
		
		this.message = message;
		this.choices = choices;
		this.sublevels = sublevels;
	}
	
	// Printing the level to the screen
	public void printLevel() { System.out.println(toString()); }
	
	// Converting the level to a string
	public String toString() {
		String s = message + "\n";
		
		for (int i = 0; i < choices.length; i++)
			s += i + ". " + choices[i] + "\n";
		s += ": ";
		
		return s;
	}
	
	// Accessors
	public String getMessage() { return message; }
	public String[] getChoices() { return choices; }
	public String getChoice(int index) { return getChoices()[index]; }
	public Level[] getSubLevels() { return sublevels; }
	public Level getSubLevel(int index) { return getSubLevels()[index]; }
}
