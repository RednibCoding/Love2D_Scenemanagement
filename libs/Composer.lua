--[[
	Class Composer
	This class manages Scene-scenes

	by: Michael Binder Nov-2017

]]



-- importing the class lib for making classes available in lua
local class = require("libs/middleclass")



Composer = class("Composer")

-- Class variable. This list keeps track of all existing scenes
-- See Scene:initialize(), each scene adds itself to this list
Composer.static._sceneList = {}

-- Is automatically called when the new() function is called
function Composer:initialize()
	self._currentScene = nil
	self._lastScene = nil
end

-- Go to a scene with the scene.name sceneName
function Composer:goToScene(sceneName)
	for k, scene in pairs(Composer._sceneList) do
		if scene._name == sceneName then
			self._lastScene = self._currentScene
			self._currentScene = scene
			break
		end
	end
end

-- If a scene was set with "goToScene(sceneName)" then update that scene
-- This function must be called in love.update()
function Composer:updateCurrentScene()
	if self._currentScene ~= nil then
		if self._lastScene ~= nil then
			self._lastScene:hide()
		end
		self._currentScene:update()
	else
		error( "Scene does not exist!")
		error( "Scenes loaded "..#Composer._sceneList)
	end
end

-- If a scene was set with "goToScene(sceneName)" then draw that scene
-- This function must be called in love.draw()
function Composer:drawCurrentScene()
	if self._currentScene ~= nil then
		if self._lastScene ~= nil then
			self._lastScene:hide()
		end
		self._currentScene:draw()
	else
		error( "Scene does not exist!")
		error( "Scenes loaded "..#Composer._sceneList)
	end
end

-- Get the reference of the current shown scene
function Composer:currentScene()
	return self._currentScene
end

-- Get the reference of the previous shown scene
function Composer:lastScene()
	return self._lastScene
end

-- Get the name of the current shown scene
function Composer:currentSceneName()
	return self._currentScene._name
end

-- Get the name of the previous shown scene
function Composer:lastSceneName()
	return self._lastScene._name
end

-- Get the number of loaded scenes
function Composer:sceneCount()
	return #Composer._sceneList
end

-- Remove the scene with name sceneName from memory
function Composer:removeScene(sceneName)
	for k, scene in pairs(Composer._sceneList) do
		if scene._name == sceneName then
			if self._currentScene == scene then 
				print("Can not remove scene because it is the current shown scene!")
				break
			else
				table.remove(Composer._sceneList, k)
				if self._lastScene == scene then
					self._lastScene = nil
				end
				break
			end
		end
	end
end

-- Remove the previous shown scene frome memory
function Composer:removeLastScene()
	for k, scene in pairs(Composer._sceneList) do
		if scene == self._lastScene then
			if scene ~= self._currentScene then
				table.remove(Composer._sceneList, k)
				if self._lastScene == scene then
					self._lastScene = nil
				end
			else
				error(scene._name.." is the current scene, so it can not be removed!")
			end
		end
	end
end

