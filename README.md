# 2023 CSSA Game Jam

---

## Theme: GLITCH

## Game name: Frog Splash - Far From Home

**Team members:**

- Jase Tran
- Tien Huynh
- Tri Le
- Long Vu

## Introduction:

Top-down dungeon-crawler 2D trap adventure game. Play as a frog trying to find its way home. The path is filled with non-obvious traps with a glitch: some of them don’t always activate, adding another layer of suspense to the player. Player wins when the frog gets home, and is welcomed with a pleasant surprise.

"“Thus fear of danger is ten thousand times more terrifying than danger itself when apparent to the eyes; and we find the burden of anxiety greater, by much, than the evil which we are anxious about...” - Daniel Defoe, Robinson Crusoe.


## Game Design:

1. Specifications:

    - Engine & Programming Language: Processing - Java

2. Environment

    a. Inspo
     - [Trap Adventure 2 #001 - YouTube](https://www.youtube.com/watch?v=C1ObitoLwhM)
     - Mario platformer.
     - Dungeon crawler.

    b. Player 
      - Has 10 health.

3. Game Logic/Interaction
   - Player dies when health reaches 0 or player steps on 'instant-death' tile.
   - Traps (visible, invisible).
   - Main-story quests (find dynamites to activate bomb).
   - Easter eggs.

## Iterations:

### 1. First Iteration: ###

- Map creation: Create an end-to-end map. Map has 1 path to the end with some hidden paths leading to rewards or keys… (depends on task systems in iteration 3).
- Player movement:
- Collision Detection:
    - Trigger (Soft Collision): taps, pressure plate, floor tiles, item, end goal
    - hard Collision: Walls, immovanle objects
    - Can incorporate multiple conditions to add subtlety
    - End goal: 
        - Display winning screen
    
- Collision Detection: Detect collisions between players and other objects (walls, floor, traps)


### 2. Second Interation: ###
## Resource:

- [Top-down movement](https://discourse.processing.org/t/top-down-game-template/22770)
- [Camera class](https://processing.org/reference/camera_.html)
- [Constrain (Colision)](https://processing.org/examples/constrain.html)
- [Map Creation](https://openprocessing.org/sketch/1627352)
