
--[[
	This is a short example on how to set up simple scene management within love
	with Composer.lua and Scene.lua

	by: Michael Binder Nov-2017
]]


-- Import the composer and scene class
require("libs/Composer")
require("libs/Scene")

-- Import the example scenes
require("scenes/Scene1")
require("scenes/Scene2")



-- Reference to the composer
local composer

function love.load()
	-- creating a new composer object
	composer = Composer:new()
	-- set the scene to go to
	composer:goToScene("Scene1")
end


function love.update()
	-- update the current scene
	composer:updateCurrentScene()
end


function love.draw()
	-- draw the current scene
	composer:drawCurrentScene()
end

-- change scene when hitting space bar
function love.keyreleased(key)
	if key == "space" then
		if composer:currentSceneName() == "Scene1" then
			composer:goToScene("Scene2")
		elseif composer:currentSceneName() == "Scene2" then
			composer:goToScene("Scene1")
		end
	end
end