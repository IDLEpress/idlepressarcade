---
title: Coin Op
layout: default
parent: Developer Guide
nav_order: 3
---

# Coin-Op

## Coin and Bill Acceptance
Game must register triggers as a quarter/token received.
- See the Utilities App section for full key mappings

Bill Acceptors are configured to output 4 triggers per $1.

Game must store credit count state indefinitely, though not necessarily between boots

## Coin UI
Game must display credit count overlay on screen, temporarily (if registered during gameplay) or permanently (if registered during attract mode), using fractions where applicable.

Depending on pricing mode it will state “¼ Credit”, “⅔ Credit”, “2 Credits”, “Free Play”, etc.  

Can opt to permanently display credit count overlay during any state

- Pressing Start button when no credits are present should temporarily display “0 Credits” overlay
- Usually display at top right of screen, but game devs discretion

Additional blinking overlay of “Press Start 1 or Start 2” should be displayed once whole credits are achieved or while in Free Play mode.

- Usually displayed center of screen VIF

- 1P and/or 2P support