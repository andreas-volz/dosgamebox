# dosgamebox
Configuration ideas and files to optimize gaming with dosbox and RetroPie

## Abstract idea
This repository is a collector for dosbox configuration on RetroPie for those features:

- Separate persistant DOS application/data from non-persistant data (aka sandboxing)
- Collect config files for popolar DOS games which are compatible with the sandbox concept and will find media with help of Skyscraper[1].
- Collect joystick mapper files for games which didn't provide joystick support in those old days
- Changed RetroPie scripts for better doxbox integration

In the chapter High Level Software Design is described how to reach this goal.

## Motivation
I like to show my kids how cool old games from by childhood were! I often impress them because I played the inital first version of a popular todays Android game.

## High Level Software Design
### Sandboxing
After some proof of concept implementations the design decision goes for Linux OverlayFS feature.
This feature consists of logic overlaying two folders ("lowerdir" and "upperdir") to a new directory ("workdir").
The mapping for DOSBox sandboxing is as following:

- lowerdir = Initial installed/configured DOS game
- upperdir = Empty in the beginning and filled with all dynamic application changes
- workdir = An overlay combination of lowerdir and upperdir

This software design allows a flexible solution to the problem that DOS games tend to write their configuration or save games directly into their application data folder. The idea is one copies a fresh installed DOS game to the "lowerdir" and it could be easy reset to the install state by removing the "upperdir".
Those aplication features could be realized later:
- Automatic remove "upperdir" files after game exists => always start clean
- Support different "upperdir" sets and so allow some sort of game configurations (e.g. different users or patch sets)
- Easy reset to initial state after you or the Game itself messed everything up

### Config File Collection
Just a DOSBox game file collection that supports the sandboxing feature and is compatible with SkyScraper[1] media scrapping. All files share some generic path concept and work only in the context of this configuration. Here is very important to add that this includes for sure only the startup configuration and no media or foreign properties. Many DOSBox games which you find somewhere in the internet contains startup config files, but they often need to be adopted to your local setup. This collection is optimized for RetorPie[3] with standalone dosbox (not lr-dosbox)

### Keyboard->Joystick Mapper
Some (old) games need adaption to the keyboard mapper to create some more fun playing them. Some are collected here and referenced from the local game specific DOSBox configuration file.

### Changed RetroPie scripts
Unfortainly I had not much success getting lr-dosbox to run with the same performance as standalone dosbox. So some (dirty) workaround (setting HDMI resultion direct) are made to get the screen resultion working for most games. Solving this problem with libretro integration or a intermediate DOSBox configuration tool (including the sandboxing support) would additional help to ease the usage.

## Open topics
- Add all modified and created files to this repositiory

[1] https://github.com/muldjord/skyscraper
[2] https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html
[3] https://github.com/RetroPie
