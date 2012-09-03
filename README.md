gideros_audio
=============

Audio control class for Gideros

This class provides:
* easy way to mute/unmute
* easy way to manage and play BGM
* easy way to manage and play SFX

```Audio.new()``` Creates a new Audio object
```Audio:setBgms(bgms)``` Sets BGMs table with ```bgms``` table
```Audio:setSfxs(sfxs)``` Sets SFXs table with ```sfxs``` table 
```Audio:clearBgms()``` Clears BGMs table
```Audio:clearSfxs()```Clears SFXs table
```Audio:addBgm(name, path)``` Adds new BGM to BGM table
```Audio:addSfx(name, path)``` Adds new SFX to SFX table
```Audio:removeBgm(name)``` Removes a BGM identified by ```name```
```Audio:removeSfx(name)``` Removes a SFX identified by ```name```
```Audio:playBgm(name, force)``` Plays a BGM identified by ```name```. Allow to replay currently playing BGM by setting ```force``` to ```true```
```Audio:playSfx(name)``` Plays a SFX identified by ```name```
```Audio:mute(mode)``` Mutes audio. Available ```mode```s are "bgm", "sfx". To mute all audio set ```mode``` to ```nil```
```Audio:unmute(mode)``` Unmutes audio. Available ```mode```s are "bgm", "sfx". To unmute all audio set ```mode``` to ```nil```

Simple example:
```
audio = Audio.new()

audio.setBgms{
	["mainmenu"] = "path/to/mainmenu.mp3",
	["gameplay"] = "path/to/gameplay.mp3"
}

audio.setSfx{
	["explosion"] = "path/to/explosion.mp3",
	["ding"] = "path/to/ding.mp3"
}

audio:playBgm("mainmenu")

audio:playSfx("explosion")

```