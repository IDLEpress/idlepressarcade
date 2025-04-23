---
title: Developer Guide
layout: default
nav_order: 2
---

# Developer Guide

**Audience: Game Developers**
{: .label .label-yellow }

## Operator Menu

The Operator Menu provides a UI for controlling certain specific game settings. Since this is an arcade game, the user doesn't have access to the settings menu. Instead the arcade operator can access the Operator Menu by pressing a non-user-accessible button located inside the cabinet.

### Coins To Play
Number of coins required to player, “Price Settings” options
- Free Play (default)
- $.25/1 credit
- $.50/1 credit
- $.75/1 credit
- $1/1 credit
- $1.25/1 credit
- $1.50/1 credit
- $1.75/1 credit
- $2/1 credit
- $2/ 3 credits
- $3/ 4 credits
- $3/ 5 credits

---

“Number of Lives” per credit, if applicable
- Alternatively, length of time of play if applicable

“Free Game Award” if applicable
- Choice of outcome that awards a free credit- such as beating game or getting a high score.

Sound Settings
- Game Volume
- Attract Mode Volume
- A note that says “Please adjust audio volume using coin door buttons outside of this menu and adjust EQ on amp inside cabinet”

Score resetting
- Reset high scores
- Reset settings to defaults

Audits (analytics)
- Quarters Counted per Period
    - This counter is resettable
- Quarters Counted All Time
    - This counter is not resettable
- Total Plays per Period
    - Resettable
- Total Plays All Time
- Free Games Awarded, if Applicable
- Average Length of Play?
    - This and any further options are at the game devs discretion.

Difficult settings (if applicable)

Other game-specific settings

## Attract Mode

Is basically an arcade game's version of a commercial on loop that's designed to grab attention and give a preview of the action.

When not in ‘active’ gameplay, game must alternate between displaying a Game Title card for 20 seconds and playing back an attract video for at least 45 seconds.  Length of times to be verified in field (VIF)
- Attract video may be a sizzle reel, gameplay demonstration (screen grab), leaderboard (if applicable), and intro cards (instructions/tutorials or story leads pulled from game).  Multiple different attract videos are a-ok.
- Game Title card 
    - Include developer credits, publisher, etc.
    - Include code version
- When whole credit is achieved the game should restart attract mode on title card, but can then proceed through usual attract mode assets.

## Coin-Op

1P and/or 2P support

### Coin and Bill Acceptance
Game must register triggers as a quarter/token received.
- Use TBD button

Bill Acceptors are configured to output 4 triggers per $1.

Game must store credit count state indefinitely, though not necessarily between boots

Game must display credit count overlay on screen, temporarily (if registered during gameplay) or permanently (if registered during attract mode), using fractions where applicable.  Depending on pricing mode it will state “¼ Credit”, “⅔ Credit”, “2 Credits”, “Free Play”, etc.  Can opt to permanently display credit count overlay during any state
- Pressing Start button when no credits are present should temporarily display “0 Credits” overlay
- Usually display at top right of screen, but game devs discretion

Additional blinking overlay of “Press Start 1 or Start 2” should be displayed once whole credits are achieved or while in Free Play mode.
- Usually displayed center of screen VIF


## High Scores

- At game devs discretion, but this encourages repeat play
- Requires Leaderboard display overlay or Leaderboard title card
- Requires initials entry system (either three letter or ten).
    - Usually- joystick sweeps through alphabet, any button confirms and moves to next digit entry
    - Should include letters, numbers, blank “ “, “End”, and delete/back
- High Score of the Day
    - Does not require leaderboard- just alerts someone that they have high score #1-3 and to enter initials.
    - Can be another title card on attract loop


## Gameplay Instructions (Tutorials)

Instructions can be in the form of printed materials that can be added to the cabinet (eg. near the controls) and/or at the start of gameplay as a tutorial or in the attract mode.

- Not required, but a short module for learning controls
- Should be skippable
    - “Press Start Button to Skip”

### Story/Intros
Should be skippable
- “Press Start Button to Skip"

## Technical Requirements
Game must be a Linux build
- If dev can only provide Windows build, we can look into supporting .exe via Wine in Linux
- We may also be able to provide a porting service for a fee

Video resolution min/max
- Arcade operator can provide monitor specs

FPS minimum
- Arcade operator should provide PC specs

Game must support IPAC-2 keyboard mappings.

Devs may specify specialty hardware necessary to support their game (TBD)

## Other Considerations

There should be no way for the user to quit the game.

The user should not have access to settings or other non-game specific areas.