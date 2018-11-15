function love.load()
  
  background = love.graphics.newVideo('/assets/pictures/background.ogv')
  
  starship = love.graphics.newImage('/assets/pictures/ship/starship.png')
  enemyPhysics = love.graphics.newImage('/assets/pictures/ship/enemyattack.png')

  starshipX = 0
  starshipY = 300
  starshipSpeed = 300


  enemyPhysicsX = 0
  enemyPhysicsY = 0
  enemyPhysicsSpeed = 300
  enemyPhysicsDelay = 100
  enemyPhysicsNumber = 0
 
  starship = {}
  starship.image = love.graphics.newImage('/assets/pictures/ship/starship.png')
  starship.x = 0
  starship.y = 300
  starship.speed = 300
  starship.bullets = {}

  shoot = love.graphics.newImage('/assets/pictures/ship/ph3.png')

end


function love.update(dt)
  backgroundVideo()

  for i,v in ipairs(starship.bullets) do
    v.x = v.x + 1000 * dt
    
    if v.x <= -2 then
      table.remove(starship.bullets, i)
    end
  end
  
  if love.keyboard.isDown("up") then
    starship.y = starship.y - starship.speed * dt
  end

  if love.keyboard.isDown("down") then
    starship.y = starship.y + starship.speed * dt
  end
  
  if love.keyboard.isDown("space") then
    bullet = {}
    bullet.x = starship.x + 76
    bullet.y = starship.y + 32.5
    table.insert(starship.bullets, bullet)
  end


  if enemyPhysicsNumber > 0 and enemyPhysicsNumber < 24 then
    enemyPhysicsX = love.math.random(10, 200)
    spawnEnemyPhysics(enemyPhysicsX)
    enemyPhysicsNumber = enemyPhysicsNumber + 1
  end
end


function love.draw()
  

  
  for i = 0, love.graphics.getWidth() / background:getWidth() do
    for j = 0, love.graphics.getHeight() / background:getHeight() do
      love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
    end
  end
  
  love.graphics.draw(starship.image, starship.x, starship.y, 0, 0.2, 0.2)
    	--love.graphics.setColor(255, 255, 255)

  for i,v in ipairs(starship.bullets) do
    love.graphics.draw(shoot, bullet.x, bullet.y, 0, 0.4, 0.4)
    		--love.graphics.rectangle("fill", v.x, v.y, 4, 4)

  end
end

function backgroundVideo()
  if background:isPlaying() then return end
  background:rewind()
  background:play()
end


function spawnEnemyPhysics()
  love.graphics.draw(enemyPhysics, enemyPhysicsX, enemyPhysicsY, 0, 0.6, 0.6)
end