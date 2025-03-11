# CHANGELOG

## version 0.0

- Added default Godot project files.
- Added basic documentation files (README, CONTRIBUTING, CHANGELOG, CREDITS)

## version 0.1

- Added testing level
- Added temporary sprite/tile sheets (player, background)
- Added player state machine w/ movement & direction
- Added player animations
- Added hitboxes and hurtboxes
- Added base NPC
- Added UI Prototype
- Merged initial scene transition
- Added dev logo splash screen

## version 0.11

- Fixed Hitbox functionality

## version 0.12

- Added player to testing scene

## version 0.13

- Added UI menus to testing scene (HUD & Upgrades)

## verson 0.14

- Added enemy
- Hitbox updates
- Added m1 attack option
- Added death state to player
- Custom camera fixes

## version 0.15

- Added player upgrades

## version 0.17

- Level Spawn Package created
- Enemy Pooling Implemented
- Hitbox/ Hurtbox balancing revision
- Export settings configured for playtesting
- Mobility Manager fixed to properly use the max_speed

## version 0.18

- Added background to title scene
- Reworked title scene nodes

## version 0.19

- Added pause menu
- HUD updates with currency

## version 0.20

- Added sound manager
- Added in sound assets for UI
- Temporary implementation of hurt sound to showcase sound manager's functionality
- Added an AudioStreamPlayer2D node to the Player scene to add in the sound manager's functionality

## version 0.21

- Added death screen
- Global quit game function

## version 0.22

- File refactoring
- New animation and asset integration system
- New test assets

## version 0.23

- Pickup sound asset added
- Hurt sound asset added
- Pickup sound implemented
- Hurt sound implemented
- Pitch randomization for pickup sound
- Changed the import defaults for wav files to stop automatic looping
- Added polyphony to player's AudioStreamPlayer2D node to allow for 10 sounds to play at the same time

## version 0.24

- Fixed a bug where the scene would transition back to the main menu automatically when the game loads.
- Bug was due to the lack of a type check in pit.gd, where upon any body being detected the pit would transition the scene. The pit was detecting part of the tilemap and transitioned the scene back to the main menu.
- There is now a check if the body detected is a part of the "Player" group and tested to make sure that the exit still functioned exit with the player

## version 0.25

- Asset size refactor
- New temporary tilesets and sprites

## version 0.26

- Fixed a bug with the wall and floor tilesets indexing transparent tiles outside of atlas

## version 0.27

- Player sounds for attacking and death added.
- Will need additional code in the future to stop death sound from being cut off

## version 0.28

- Global inventory refactor
- UI sounds added

## version 0.29

- Player sounds for attacking and death added
- Will need additional code in the future to stop death sound from being cut off
- Balanced player movement and hitboxes
- Modified enemy knockback
- Modified look for exit for playtest

## version 0.30

- Fixed tile map collision issue
- Patched enemy pathfinding

## version 0.31

- Patched enemies upgrading with player

## version 0.32

- Patched attack sounds being cut off by pick up sounds and vice versa
- Created a new AudioStream2D for the player to handle the inventory, and specified that the existing one should handle the voice
- Created color blindness shaders for Deuteranopia, Protanopia, Triatanopia, and Achromatopsia
- Each of the shaders has the accreditation written in their code, and the plans for how to implement them in the game
- A testing scene was made to showcase these shaders, `shader_test.tscn` and a testing image `test.png` was used from the article referenced for the shader code as a sprite that the shaders can attach to
- To test a shader, simply drag the shader to the `Sprite2d`'s shader exported variable under its shader material in the inspector

## version 0.33

- Added zoom feature to camera- can be removed in final game
- Level generator now bakes a navmesh over tilemap, so enemies properly pathfind
- Fixed tile map going out of bounds
- Added sword cursor
- Enemies go straight to death state
- Refined the generation to force entrances and exits to be a specified distance from each other
- Refined generation to make rooms more consistently sized
- Made Lust room smaller
- Cleaned up mobility manager

## version 0.34

- Fixed bug, stats now upgrade separately
- Added new signal for updating HUD elements

## version 0.35

- Bug-fixed and refined player and wall collisions
- Added a new wall tileset
- Fixed enemy animation bounce
- Increased wall height
- Grayboxed particle effects on pickups

## version 0.36

- Added particle effects to player attack
- Edit collision
- Player movement refining

## version 0.37

- Added in assets from Phoebe's UI work (HUD, Upgrade icons(Health Damage Speed), temp icon for currency (Still needs to have transparent background)) to the file system under `assets/ui_models`
- HUD Border will need to be refined because it obscures too much of the screen, for now the transparency is lowered to allow for an easy replacement
- Reordered node hierarchy to support the HUD changes. There are two main nodes now associated with the HUD, one for the border HUD with the health, currency, mini-map, and upgrade button, and another for the upgrade menu itself. This change was meant to prevent scaling the HUD accidentally scaling the upgrade menu, and allow for the transparency of the HUD texture to be lowered while keeping the information like the health and currency still fully visible
- Pathing in the `hud.gd` code was adjusted to fit these changes

## version 0.38

- Added CSV file importing for Upgrade Manager
- HUD now starts at Lvl 0

## version 0.39

- Upgrades now have a space for icons
- Fixed upgrade menu going behind HUD
- Merged in the foundation of the Options menu from the branch `jackson-jack-options`
- Changed hotspot for cursor to better match the tip of the sword image

## version 0.40

- Added in new assets from Phoebe for buttons, the main menu, and currency
- Changed the main menu scene to include the main menu book, and the new play button
- Polished the play button so on mouse hover, it turns red
- Refactored the upgrade menu to have more readable font size, and centered the text for the upgrade name.
- Implemented the new button textures into the pause menu
- Changed upgrade names, and made them use all uppercase letters
- Speed icon added to upgrade UI

## version 0.41

- Enemies now have a patrol state. They walk around searching for player
- Enemies use navigator to get next direction from nav mesh
- Enemies have a target tracker to handle the reference to the node they are chasing (usually the player)
- Fixed all map issues: - Map generator walks with a 2 tile cursor preventing 1 tile tall areas that can be blocked by new wall collision - Map cannot place an entrance or exit on a floor tile that does not have a floor tile below it. (This prevents wall collision from blocking it)

## version 0.42

- Added Options menu UI
- Added UI navigation with controller
- New controller input for inventory

## version 0.43

- Walls now spawn on every tile that isn't a floor tile
- Y-ordering slightly implemented - in need of bug testing
- Added player and enemy silhouette to show entites below walls

## version 0.44

- Enemy AI refined
- Enemy now has explicit attack state and that is the only time their hitbox is active
- Map generator walks with a 2 tile cursor preventing 1 tile tall areas that can be blocked by new wall collision
- Map cannot place an entrance or exit on a floor tile that does not have a floor tile below it. (This prevents wall collision from blocking it)

## version 0.45

- Created tutorial scene
- Attached video slide show that is cycled through using buttons
- Added a button to the main menu to initiate the tutorial
- In the future, the game will detect if the player is playing for the first time and set a flag to show the tutorial when the play button is pressed.
- Added additional version of tutorial videos in GIF format for future use.

## version 0.46

- High-Contrast shader written, used a GPT conversation as a starting point and worked the math into my own code while crediting the original conversation in the shader's code.
- Fixed typo in tutorial text from "Left Stick to Aim" to "Right Stick to Aim"

## version 0.47

- Localization functioning on all static UI elements that are not custom buttons
- An options button will be available in the main menu in the future
- Available languages are English, Mexican Spanish, and French

## version 0.48

- Fixed ordering of tutorial slides
- Added proper instructions about controls to open upgrade menu

## version 0.49

- Added death scene

## version 0.50

- Fixed extra text on death screen

## version 0.51

- Fixed option menu not reopening pause menu

## version 0.52

- Fixed upgrade manager not reseting on death

## version 0.53

- Changed particle texture

## version 0.54

- Added currency (tooth) spritesheet to assets folder
- Added health (heart) spritesheet to assets folder
- Added temporary wall border tilesets to assets folder

## version 0.55

- Swapped the direction the cursor faces
- Refactored play scene handling
- Deleted Limbo scene, since all main play will take play in "scene_config_package" - All scene ordering and generation configuring is in the global script "level_manager" - "scene_config_package" should be renamed to something like play scene or level
- Connected all menu scenes to "scene_config_package"

## version 0.56

- Levels now require you to defeat an enemy before moving to the next level. The system is configured for easy balancing
- basic_enemy renamed to infinimouth

## version 0.57

- Added stat bonus displays to upgrade menu
- Fixed upgrades not persisting across levels
- Fixed player health not persisting across levels
- Fixed speed upgrades scaling faster than intended
- Made health an item stored in the Inventory

- Levels now require you to defeat an enemy before moving to the next level. The system is configured for easy balancing
- basic_enemy renamed to infinimouth

## version 0.58

- Player hitbox now spins around player instead of locking to axis

## version 0.59

- Level manager now controls when the exit is enabled (v.56 refactor)
- New signal in SignalBus for when required enemies are killed
- Removed spam print statement

## version 0.60

- Implemented a global script, ShaderManager that changes the material on a new scene, Filter, that is a ColorRect placed over the global SceneTransition scene
- Since SceneTransition exists over the top of the entire game, this is a quick way to apply the filter to all scenes without any scene knowing about it
- It is important that if the dropdown of the options menu's shaders change order, **this needs to be reflected in the ShaderManager's SHADER_POOL const variable**

## version 0.61

-	Added and implemented player attack animations
-	Implemented currency animation
-	Added currency (tooth) spritesheet to assets folder
-	Added health (heart) spritesheet to assets folder
-	Added temporary wall border tilesets to assets folder

## version 0.63

- Dungeon walls now auto-tile
- The script functions correctly, but it needs an updated tile map

## version 0.64

- Player can now dash, using the shift key
- The dash state mobility attributes need balancing

## version 0.65

- Main menu music implemented with a global MusicManager scene
- Changed the cursor to a high contrast grayscale version cursorV3, with another option as well, cursorV2
- Made character attack noise louder
- Created a spritesheet for the blood spatter hurt overlay
- Added the new HUD sprite hudV2, but because it was still pretty big, I chopped it up and created the temporary hudV3 and tweaked the HUD scene so it properly fit
- Lust is set up now to play its music once I create the asset for it.
- Added Lust's music and it plays when the scene starts
- Fixed weird misalignment of HUD border

## version 0.66

- Trimmed the edges of the main menu book image so that it scales better and fits the viewport nicely without it getting separated from its origin
- Main menu layout has been finalized. The title is now on the book and the book covers nearly the whole screen
- Added dummy button for options menu so that the work can be started on implementing the ability for options to be managed at start
- The ShaderManager now uses an enum for the ability for other scenes to more easily set a shader manually, which is used for `rozy_mode`, a debug boolean flag in the scene transition scene that sets the high contrast mode automatically at start
- The tutorial's text label now extends to the edges of the screen and wraps based on the word
- The tutorial now explains that the button used to show the upgrade menu also hides the upgrade menu

## version 0.67

- Game now has point manager
- Enemy manager tells point manager to increase points every time an enemy dies
- When the player dies or the quit button is pressed, the game saves
- Currently, the high score is the only thing that is saved
- You can clear your save data by pressing the "L" button
- In the future, we can discuss better save management, like dedicated save UI

## version 0.68
- Enemy attack, hurt, and death sound implemented
- Player dash sound implemented
- Health pickup sound added and framework is ready for scene implementation, it is under `SoundManager.PlayerSounds.HEAL`
- Currency pickup sound reworked, and reimplemented
- Volume mixing done to balance out sound effects
- Removed code meant for music that was in `sound_manager.gd` as that functionality is in `music_manager.gd`
- Set up functionality in `music_manager.gd` and `sound_manager.gd` to allow for muting sound effects and/or music. This can be used later as an option in the options menu for players who want to do away with either optionally. They use function `mute_music()`, `unmute_music()`, `mute_sfx()` and `unmute_sfx()` to flip a flag that will permit or block audio playback

## version 0.69

- Added enemies killed count to HUD
- Added new upgrade menu assets

## version 0.70

- Fixed debugger error, removed defunct variable

## version 0.71
- Enemy inifinimouth now tints to be more read when it is getting ready to pounce.
- High score is now displayed in the main menu.

## version 0.72

- Refactor, options menu now creatable by any scene
- Added options menu to main menu

## version 0.73

- Health drop implemented.
- Enemy now has 50% chance to drop health or currency
- Item manager now handles instancing items
- All items are collectibles with different types

## version 0.74

- Fixed issue where hitbox could rotate around player while they are attacking
- It is now locked to starting position when the player attacks

## version 0.75
- Audio mixing to get sounds more balanced
- Death screen now has its own theme
- New variables `volume_mult` have been added to `SoundManager.gd` and `MusicManager.gd` to ease the future process of having the options menu allow for mixing the volume of sound effects on a user to user basis
- Added noise for health pickup
- Tweaked the pitch randomization of the currency pickup noise to not have as much chance of lower, slower playback as it was sounding a bit too distorted.

## version 0.76

- Added map hint function and call for it
- The map hint function marks tiles for the next level randomly within a radius around the exit
- The renderer is updated to place the next level's floor tiles for tiles that are marked as "next"
- Removed wall level 2 and ceilining tile map layers since we are no longer using them

## version 0.77

- Item gravitation added

## version 0.78

- Player dodge animations added

## version 0.79

- Replaced floor tilesets.
- Adjusted contrast.

## version 0.80

- Hitboxes can no longer land hits through walls
-    This goes for both the player and the enemy
- You can now pick up items with attacks

## version 0.81

- Fixed particle bug with player attack where the particle textures were not showing
- Implemented a new function in `ShaderManager.gd` called `shake(shake_target,duration)` that will take a node and shake for the given duration, note that this will reset its shader back to null after the duration is complete
- Upgrade book texture shakes when the player tries to upgrade without enough money

## version 0.82

- Hurt shader now is applied when the character gets hurt
- Doesn't work when the character enters death state, there's a specific animation in the works for the death state however

## version 0.83

- Refactored wall rendering algorithm. Now uses layered rendering to require fewer tile assets
- Includes corner pieces
- Darkened the tile used for the background of each level

## version 0.84

- Minimap implemented
- Minor movement drag patch

## version 0.85

- Fixed bug where the book texture was not set in the upgrade UI scene, causing the shake shader to fail
- Pausing and unpausing now have a sound jingle
- Removed sound options for `PLAY` and `MOVE_SELECTION` because the sounds were fairly irritating and/or didn't fit the vibe
- Removed all audio that was unused from the project

## version 0.86

- Added support for Japanese translations
- Expanded localization to cover all writing except for tutorial descriptions
- Upgrade manager stat keys were updated to match the translation CSV keys for easy passing between both

## version 0.87

- Added border to mini-map
- Mini-map now follows the player
- Added a new variable `zoom_multiplier` to the `config_mini_map()` function which handles how closely it zooms on the player
- The Playstation X, XBOX A, Nintendo B buttons can be used to accept menu choices
- The dash action now has controller support, using Left Trigger as the button mapping
- Fixed a localization bug where the "ENEMIES SLAIN" text at the top was not being localized
- Changed the order of the options menu buttons so that the "Back" button is at the bottom of the list of choices
- PS Circle, XBOX B, and Nintendo A can no longer be used to select options in the menu, as it might cause confusion with players using controllers where those options would be considered "Back" buttons

## version 0.88

- Fixed being able to unpause from options menu
- Fixed inventory currency count not updating between runs
- Fixed crash bug with save system
- Removed unused code from Upgrade manager and player

## version 0.89

- Added animated entrance and exit tiles as well as a locked exit image

## version 0.90

- Fixed various UI elements not grabbing focus on menu navigation
- Added quit button to main menu

## version 0.91

- Finished tutorial rework
- Added special shader for the locked version of the exit
- Removed unused old `.ogv` files that were used for the previous tutorial
- The tutorial now allows for placing label text on the top or bottom of the slides
- Localization now fully complete, as it supports the tutorial
- Removing old `.gif` files that were going to try to be used if needed
- Exit now swaps between a static sprite, and an animated sprite depending on whether or not the exit is unlocked yet
- Health now has a 1/9 chance of dropping instead of a 1/2
- When quitting from the game, the main menu music will start now 

## version 0.92

- Fixed game crashing bug:
-    Previously, game crashed in levels 2+ because of the mini map
-    Some part of the mini map caused the game to randomly crash when the player dashed or swung their sword
-    Temporarily fixed this by commenting out call to configure mini map
- While attempting to patch this bug, fixed massive memory issues:
-    Tile map Map and Tile nodes were instanced, but not added to the tree, causing them to not be freed when changing scenes
-    Changed code to add Map and Tile objects to scene tree when instanced
-    The same change was made for the Pool object
-      Each enemy pool is added as a child to the enemy manager (enemies are the only object currently being pooled)
-      Refactored object pool to instance all objects and turn them off instead of leaving them outside of the scene tree. 
