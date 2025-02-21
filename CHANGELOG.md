# CHANGELOG

## version 0.0

-   Added default Godot project files.
-   Added basic documentation files (README, CONTRIBUTING, CHANGELOG, CREDITS).

## version 0.1

-   Added testing level
-   Added temporary sprite/tile sheets (player, background)
-   Added player state machine w/ movement & direction
-   Added player animations
-   Added hitboxes and hurtboxes
-   Added base NPC
-   Added UI Prototype
-   Merged initial scene transition.
-   Added dev logo splash screen

## version 0.11

-   Fixed Hitbox functionality

## version 0.12

-   Added player to testing scene

## version 0.13

-   Added UI menus to testing scene (HUD & Upgrades)

## verson 0.14

-   Added enemy
-   Hitbox updates
-   Added m1 attack option
-   Added death state to player
-   Custom camera fixes

## version 0.15

-   Added player upgrades

## version 0.17

-   Level Spawn Package created
-   Enemy Pooling Implemented
-   Hitbox/ Hurtbox balancing revision
-   Export settings configured for playtesting
-   Mobility Manager fixed to properly use the max_speed

## version 0.18

-   Added background to title scene
-   Reworked title scene nodes

## version 0.19

-   Added pause menu
-   HUD updates with currency

## version 0.20

-   Added sound manager
-   Added in sound assets for UI
-   Temporary implementation of hurt sound to showcase sound manager's functionality.
-   Added an AudioStreamPlayer2D node to the Player scene to add in the sound manager's functionality.

## version 0.21

-   Added death screen
-   Global quit game function

## version 0.22

-   file refactoring
-   new animation and asset integration system
-   new test assets

# version 0.23

-   Pickup sound asset added
-   Hurt sound asset added
-   Pickup sound implemented
-   Hurt sound implemented
-   Pitch randomization for pickup sound.
-   Changed the import defaults for wav files to stop automatic looping.
-   Added polyphony to player's AudioStreamPlayer2D node to allow for 10 sounds to play at the same time.

# version 0.24

-   Fixed a bug where the scene would transition back to the main menu automatically when the game loads.
-   Bug was due to the lack of a type check in pit.gd, where upon any body being detected the pit would transition the scene. The pit was detecting part of the tilemap and transitioned the scene back to the main menu.
-   I have changed it to check if the body detected is a part of the "Player" group and tested to make sure that the pit still functioned nominally with the player.

## version 0.25

-   asset size refactor
-   new temporary tilesets and sprites

## version 0.26

-   Fixed a bug with the wall and floor tilesets indexing transparent tiles outside of atlas

## version 0.27

-   Player sounds for attacking and death added.
-   Will need additional code in the future to stop death sound from being cut off.

## version 0.28

-   Global inventory refactor
-   UI sounds added

## version 0.29

-   Player sounds for attacking and death added.
-   Will need additional code in the future to stop death sound from being cut off.
-   Balanced player movement and hitboxes
-   Modified enemy knockback
-   Modified look for exit for playtest

## version 0.30

-   Fixed tile map collision issue
-   Patched enemy pathfinding

## version 0.31

-   Patched enemies upgrading with player

## version 0.32

-   Patched attack sounds being cut off by pick up sounds and vice versa
-   Created a new AudioStream2D for the player to handle the inventory, and specified that the existing one should handle the voice.
-   Created color blindness shaders for Deuteranopia, Protanopia, Triatanopia, and Achromatopsia.
-   Each of the shaders has the accreditation written in their code, and the plans for how to implement them in the game.
-   A testing scene was made to showcase these shaders, `shader_test.tscn` and a testing image `test.png` was used from the article referenced for the shader code as a sprite that the shaders can attach to.
-   To test a shader, simply drag the shader to the `Sprite2d`'s shader exported variable under its shader material in the inspector.

## version 0.32

-   Added zoom feature to camera- can be removed in final game.
-   Level generator now bakes a navmesh over tilemap, so enemies properly pathfind.
-   Fixed tile map going out of bounds.
-   Added sword cursor.
-   Enemies go straight to death state.
-   Refined the generation to force entrances and exits to be a specified distance from eachother.
-   Refined generation to make rooms more consistently sized.
-   Made Lust room smaller.
