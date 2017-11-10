--[[
	This is a short example of how to create a scene class that is inheriting from Scene

	by: Michael Binder Nov-2017
]]


-- importing the class lib for making classes available in lua
local class = require("libs/middleclass")

-- importing the composer and scene class
require("libs/Composer")
require("libs/Scene")

-- inheriting from Scene
Scene1 = Scene:subclass("Scene1")

-- every scene must have an initialize function
-- here goes everything that has to be done once and before the scene is shown
function Scene1:initialize()
	-- call super.initialize is crucial, so are the arguments self and name (Scene1)
	-- each scene must have a unique name
	Scene.initialize(self, "Scene1")
end

-- here goes the code that would normally go in love.update()
-- eg. game logic ... etc.
function Scene1:update()
end

-- here goes the code that would normally go in love.draw()
-- eg. drawing images
function Scene1:draw()
	love.graphics.print("This is Scene1")
end

-- if there is another scene than this one going to be shown, then this function
-- will automatically be called by the composer
-- so code to make this scene ready to be hidden goes here
-- eg. stop playing sounds etc...
function Scene1:hide()
end


-- Creating a new instance
-- this can be called everywhere as long as it is legit to love
Scene1:new()