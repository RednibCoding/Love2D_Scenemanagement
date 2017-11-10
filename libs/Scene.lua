--[[
	Class Scene
	Every scene has to inherit from this class in order to work with the composer
	For an example see: Scene1.lua and Scene2.lua

	by: Michael Binder Nov-2017
]]


-- importing the class lib for making classes available in lua
local class = require("libs/middleclass")

-- imporing the composer
require("libs/Composer")



Scene = class("Scene")

-- this will be called automatically when the function new() is called
function Scene:initialize(sceneName)
	-- each scene must have a unique name
	self._name = sceneName
	-- add this scene to the composer scene list
	table.insert(Composer._sceneList, self)
end

-- for the inheriting scene class
function Scene:update()
end

-- for the inheriting scene class
function Scene:draw()
end

-- for the inheriting scene class
function Scene:hide()
end
