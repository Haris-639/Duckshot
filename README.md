# DuckShot - Mallard Mayhem

DuckShot is a retro-style 2D shooting game written entirely in x86 Assembly Language using BIOS and DOS interrupts. The game is played in real mode, drawing pixel graphics in VGA mode 13h. Your mission is to shoot down ducks across three challenging levels.

## Gameplay Overview

- **Level 1:** Shoot 1 duck with unlimited bullets.
- **Level 2:** Shoot 2 ducks with unlimited bullets.
- **Level 3:** Shoot 3 ducks with only 3 bullets. You also get a bonus reward if collected.

## Controls
- **Arrow Keys**: Move shooter (↑ ↓ ← →)
- **Spacebar**: Shoot
- **Enter**: Navigate menu or confirm
- **Esc**: Exit game
- **P (key code 70h)**: Pause the game

## Features

- VGA graphics in mode 13h
- Colorful pixel-based rendering (ducks, shooter, trees, bonus reward)
- Multiple game levels with difficulty scaling
- In-game sound using PC speaker (BEEP)
- File handling for saving player names and scores (`file.txt`)
- Real-time collision detection
- Lives and bonus tracking in hard mode

## Technical Details

- **Language:** x86 Assembly
- **Mode:** 16-bit real mode
- **Graphics:** VGA Mode 13h (320x200, 256 colors)
- **Assembler:** TASM / MASM recommended
- **OS:** Runs under DOSBox or native MS-DOS
  
## Running the Game

1. Open the project in DOSBox.
2. Assemble and link using:

    ```bash
    tasm duckshot.asm
    tlink duckshot.obj
    duckshot.exe
    ```

3. Play the game!

> Tip: Use DOSBox with `cycles=3000` for smoother performance.


## File Structure

- `duckshot.asm` – Main game logic and procedures
- `file.txt` – Output file for storing player names and scores (auto-created)
- `README.md` – Project documentation


## Educational Value

This project demonstrates:
- Low-level graphics rendering
- Input handling with BIOS interrupts
- Real-mode file I/O in DOS
- Game design using procedural programming in Assembly
- Performance-efficient collision logic


## License

This project is released for educational and personal use. Attribution is appreciated if reused or modified.


## Credits

Developed by Haris Usman. Inspired by retro arcade shooters and classic PC speaker games.
