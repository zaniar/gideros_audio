--[[

 Bismillahirahmanirrahim
 
 Audio control class for Gideros
 by: Edwin Zaniar Putra (zaniar@nightspade.com)

 This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
 Copyright � 2012 Nightspade (http://nightspade.com).
 
--]]

Audio = Core.class()

function Audio:init()
	self.bgmChannel = nil
	self.bgmCurrentName = nil
	self.bgmCurrent = nil
	self.bgmPos = 0
	
	self.bgmMute = false
	self.sfxMute = false

	self.bgms = {}
	self.sfxs = {}
end

function Audio:setBgms(bgms)
	self.bgms = bgms
end

function Audio:setSfxs(sfxs)
	for name, path in pairs(sfxs) do
		self.sfxs[name] = Sound.new(path)
	end
end

function Audio:clearBgms()
	self.bgms = {}
end

function Audio:clearSfxs()
	self.sfxs = {}
end

function Audio:addBgm(name, path)
	self.bgms[name] = path
end

function Audio:addSfx(name, path)
	self.sfxs[name] = Sound.new(path)
end

function Audio:removeBgm(name)
	self.bgms[name] = nil
end

function Audio:removeSfx(name)
	self.sfxs[name] = nil
end

function Audio:playBgm(name, force)
	if name ~= self.bgmCurrentName or force then
		if self.bgmChannel then
			self.bgmChannel:stop()
			self.bgmChannel = nil
			self.bgmCurrentName = nil
			self.bgmCurrent = nil
			self.bgmPos = 0
		end
		if not self.bgmMute and not self.bgmChannel then
			self.bgmCurrentName = name
			self.bgmCurrent = Sound.new(self.bgms[name])
			self.bgmChannel = self.bgmCurrent:play(self.bgmPos, math.huge)
		end
	end
end

function Audio:playSfx(name)
	if not self.sfxMute then
		return self.sfxs[name]:play()
	end
end

function Audio:mute(mode)
	if mode == "bgm" then
		self.bgmMute = true
		if self.bgmChannel then
			self.bgmPos = self.bgmChannel:getPosition()
			self.bgmChannel:stop()
			self.bgmChannel = nil
		end
	elseif mode == "sfx" then
		self.sfxMute = true
	else
		self.bgmMute = true
		if self.bgmChannel then
			self.bgmPos = self.bgmChannel:getPosition()
			self.bgmChannel:stop()
			self.bgmChannel = nil
		end
		self.sfxMute = true
	end
end

function Audio:unmute(mode)
	if mode == "bgm" then
		self.bgmMute = false
		self.bgmChannel = self.bgmCurrent:play(self.bgmPos, math.huge)
	elseif mode == "sfx" then
		self.sfxMute = false
	else
		self.bgmMute = false
		self.bgmChannel = self.bgmCurrent:play(self.bgmPos, math.huge)
		self.sfxMute = false
	end
end