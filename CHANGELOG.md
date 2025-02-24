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

## version 0.33

-   Added zoom feature to camera- can be removed in final game.
-   Level generator now bakes a navmesh over tilemap, so enemies properly pathfind.
-   Fixed tile map going out of bounds.
-   Added sword cursor.
-   Enemies go straight to death state.
-   Refined the generation to force entrances and exits to be a specified distance from eachother.
-   Refined generation to make rooms more consistently sized.
-   Made Lust room smaller.
-   Cleaned up mobility manager

## version 0.34

-   Fixed bug, stats now upgrade separately
-   Added new signal for updating HUD elements

## version 0.35

-   Bug-fixed and refined player and wall collisions
-   Added a new wall tileset
-   Fixed enemy animation bounce
-   Increased wall height
-   Grayboxed particle effects on pickups

## version 0.36

-   Added particle effects to player attack
-   Edit collision
-   Player movement refining

## version 0.37

-   Added in assets from Phoebe's UI work (HUD, Upgrade icons(Health Damage Speed), temp icon for currency (Still needs to have transparent background)) to the file system under `assets/ui_models`
-   HUD Border will need to be refined because it obscures too much of the screen, for now the transparency is lowered to allow for an easy replacement
-   Reordered node hierarchy to support the HUD changes. There are two main nodes now associated with the HUD, one for the border HUD with the health, currency, mini-map, and upgrade button, and another for the upgrade menu itself. This change was meant to prevent scaling the HUD accidentally scaling the upgrade menu, and allow for the transparency of the HUD texture to be lowered while keeping the information like the health and currency still fully visible.
-   Pathing in the `hud.gd` code was adjusted to fit these changes.

## version 0.38

-   Added CSV file importing for Upgrade Manager
-   HUD now starts at Lvl 0

## version 0.39

-   Upgrades now have a space for icons
-   Fixed upgrade menu going behind HUD
-   Merged in the foundation of the Options menu from the branch `jackson-jack-options`
-   Changed hotspot for cursor to better match the tip of the sword image.

## version 0.40

-   Enemies now have a patrol state. They walk around searching for player
-   Enemies use navigator to get next direction from nav mesh.
-   Enemies have a target tracker to handle the reference to the node they are chasing (usually the player)
-   Fixed all map issues:
		- Map generator walks with a 2 tile cursor preventing 1 tile tall areas that can be blocked by new wall collision
		- Map cannot place an entrance or exit on a floor tile that does not have a floor tile below it. (This prevents wall collision from blocking it)
