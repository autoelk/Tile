function love.load()
  grid = {{1, 2, 3},{4, 5, 6},{7, 8, " "}}
  size = 100

  font = love.graphics.newFont(size / 2)
  love.graphics.setFont(font)

  -- randomize tiles
  math.randomseed(os.time())
  for i = 1, 3 do
    for j = 1, 3 do
      newI = math.ceil(math.random(1,3))
      newJ = math.ceil(math.random(1,3))
      swapTiles(i, j, newI, newJ)
    end
  end

  for i = 1, 3 do
    for j = 1, 3 do
      if grid[i][j] == " " then
        blankR = i
        blankC = j
      end
    end
  end
end

function love.draw()
  love.graphics.setBackgroundColor(1,1,1)

  love.graphics.setColor(0,0,0)
  for i = 1, 3 do
    for j = 1, 3 do
      love.graphics.rectangle("line", i * size, j * size, size, size)
      love.graphics.printf(grid[i][j], i * size, (j + 0.25) * size, size, "center")
    end
  end
end

function love.update()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "up" then
    swapTiles(blankR, blankC, blankR, blankC + 1)
  end
  if key == "down" then
    swapTiles(blankR, blankC, blankR, blankC - 1)
  end
  if key == "right" then
    swapTiles(blankR, blankC, blankR - 1, blankC)
  end
  if key == "left" then
    swapTiles(blankR, blankC, blankR + 1, blankC)
  end
end

function swapTiles(r1, c1, r2, c2)
  if r2 <= 3 and r2 >= 1 and c2 <= 3 and c2 >= 1 then
    swap = grid[r1][c1]
    grid[r1][c1] = grid[r2][c2]
    grid[r2][c2] = swap
    blankR = r2
    blankC = c2
  end
end