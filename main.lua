--part 2 of a series on building a simple platformer using love 2d.
--code hosted at: https://github.com/lackluster-games/simple-platformer-ex-2
--licensed inde the GPL
--  Copyright (C) <2020>  <return5>
--
--   This program is free software: you can redistribute it and/or modify
--   it under the terms of the GNU General Public License as published by
--   the Free Software Foundation, either version 3 of the License, or
--   (at your option) any later version.
--
--   This program is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--   GNU General Public License for more details.
--
--   You should have received a copy of the GNU General Public License
--   along with this program.  If not, see <https://www.gnu.org/licenses/>.

--tell lua about 'Characters.lua'
require "Characters"

--load stuff at start of the game
function love.load()
    player = CHARACTER:new(20,20,10,"player.png")   --make a player object
    enemy  = ENEMY:new(80,80,1,"enemy.png")    --make an enemy object
    HEIGHT = 150  --height of screen
    WIDTH  = 150  --right hand boundary
end

--draw stuff each frame
function love.draw()
    love.graphics.draw(player.icon,player.x,player.y)  --draw player to screen
    love.graphics.draw(enemy.icon,enemy.x,enemy.y)     ---draw enemy to screen
end

--updates every frame. 
function love.update()
    enemy:move()  --on each frame move the enemy.
end

--handle keyboard input 
function love.keypressed(key)
    if key == "w" then
        player.y = player.y - 10  
        if player.y < 0 then     --if player ties to go above the upper boundary
            player.y = 0
        end
    elseif key == "s" then
        player.y = player.y + 10  
        if player.y > HEIGHT then   --if player tries to go below lower boundary
            player.y = HEIGHT
        end
    elseif key == "a" then
        player.x = player.x - 10   
        if player.x < 0 then      --if player tries to go pass the left hand boundary
            player.x = 0
        end
    elseif key == "d" then
        player.x = player.x + 10   
        if player.x > WIDTH then  --if player tries to go pass the right hand boundary
            player.x = WIDTH
        end
    end
end



