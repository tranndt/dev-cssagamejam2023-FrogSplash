# 2023 CSSA Game Jam

---

## Theme: GLITCH

**Team members:**

- Jase Tran
- Tien Huynh
- Tri Le
- Long Vu

## Introduction:

Top down 2D trap adventure game. The path is filled with non-obvious traps with a glitch: they don’t always activate. Whenever one does and the player dies and has to replay their path, one of such previously unactivated traps might suddenly do, adding another layer of suspense to the player. Player wins when they get to the end of the map, and is welcomed with a pleasant surprise.

## Game Design:

1. Specifications:

    - Engine & Programming Language: Processing - Java

2. Environment

    a. Inspo
     - [Trap Adventure 2 #001 - YouTube](https://www.youtube.com/watch?v=C1ObitoLwhM)
     - Mario platformer
     - Dungeon crawler

    b. Player 
      - Appearance
       - Abilities

3. Game Logic/Interaction

   - Traps

## Iterations:

### 1. First Iteration: ###

- Map creation: Create an end-to-end map. Map has 1 path to the end with some hidden paths leading to rewards or keys… (depends on task systems in iteration 3).
- Player movement: 
    - 4 or 8 directions?
    - Shoot? (COuld have hidden walls that reflect the shoot)
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
