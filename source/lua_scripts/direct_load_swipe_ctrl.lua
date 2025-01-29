---@diagnostic disable: lowercase-global, undefined-global, need-check-nil, inject-field, undefined-field
-- #####
-- for slowing down: 0.01 to 0.5
local drag = 0.1
-- #####
local luaProcessor = self.parent.parent.children.luaProcessor
local last_x
local speed = 0
local swiping = false
local rolling = true
local home = false
local scrollable
local parent

function init()
  scrollable = self.parent.children.buttonGroup.frame
  parent = self.parent.frame
  last_x = parent.w / 2
end

local delay = 25
local last = 0

function update()
  now = getMillis()
  if (now - last < delay) or swiping or (speed == 0 and home) then return end
  last = now
  getHome()
end

function getHome()
  local width = parent.w
  local center = width/2
  local accel = math.fmod(math.abs(scrollable.x), parent.w)
  if accel == 0 and speed == 0 then
    home = true
    return
  end
  home = false
  if accel > center then
    accel = accel-width
  elseif accel < center then
    accel = accel
  end
  accel = accel/center*20
  if accel > 0.1 then
    if speed < -accel and rolling then
      slowDown()
    elseif math.abs(speed) < accel then
      speed = speed+accel/10
      rolling = false
    end
    if not rolling and speed > 0 then
      speed = math.max(2, math.min(accel, speed))
    end
    pan(speed)
  elseif accel < -0.1 then
    if speed > -accel and rolling then
      slowDown()
    elseif math.abs(speed) < -accel then
      speed = speed+accel/10
      rolling = false
    end
    pan(speed)
    if not rolling and speed < 0 then
      speed = math.min(-2, math.max(accel, speed))
    end
  elseif math.abs(speed) < 5 then
    home = true
    rolling = true
    speed = 0
    print('HOME')
  end
  print('accel: ' .. accel)
  print('speed: ' .. speed)
end

function slowDown()
  if math.abs(speed) == 0 then return end
  -- print('slow down')
  local sign = math.abs(speed)/speed
  speed = speed - sign*drag*math.abs(speed)
  if speed < 0 and speed > -1  then
    speed = -1
  elseif speed > 0 and speed < 1 then
    speed = 1
  end
end

function pan(x)
  scrollable.x = scrollable.x + x
  -- wrap around
  if scrollable.x < -parent.w*1.5 then
    scrollable.x = scrollable.x + parent.w*1
    luaProcessor:notify('pagePlusDirectLoad')
  elseif scrollable.x > -parent.w*0.5 then
    scrollable.x = scrollable.x - parent.w*1
    luaProcessor:notify('pageMinusDirectLoad')
  end
end

function onPointer(pointers)
  x = pointers[1].x
  if pointers[1].state == PointerState.BEGIN then
    swiping = true
    rolling = true
    home = false
    speed = 0
    last_x = x
  elseif pointers[1].state == PointerState.MOVE then
    local delta = math.floor(x-last_x)
    pan(delta)
    speed = delta
    last_x = x
  elseif pointers[1].state == PointerState.END then
    swiping = false
  end
end