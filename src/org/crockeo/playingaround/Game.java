package org.crockeo.playingaround;

import java.util.Scanner;

public class Game {
	private final Scanner scanner = new Scanner(System.in);
	private boolean running = false;

	// Starting and stopping
	public void start(String loadpath) { running = true; gameLoop(LevelLoader.instance().loadLevel(loadpath)); }
	public void stop() { running = false; }
	
	// Accessors
	public boolean isRunning() { return running; }
	
	
	////
	// Game engine
	//
	
	// Updating the game
	private Level updateGame(Level level, int input) { return level.getSubLevel(input); }
	
	// Drawing the game
	private void drawGame(Level level) {  level.printLevel(); }
	
	// The game loop itself
	private void gameLoop(Level startLevel) {
		Level currentLevel = startLevel;
		
		while (running) {
			drawGame(currentLevel);
			currentLevel = updateGame(currentLevel, scanner.nextInt());
		}
	}
}
