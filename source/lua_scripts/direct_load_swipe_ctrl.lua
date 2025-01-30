---@diagnostic disable: lowercase-global, undefined-global, need-check-nil, inject-field, undefined-field
-- #####
local drag = 0.05
local springiness = 5
local minSpeed = 15
-- #####
local latched = 1
local luaProcessor = self.parent.parent.children.luaProcessor
local last_x
local speed = 0
local swiping = false
local home = false
local delay = 25
local last = 0
local scrollable
local center
local width

function init()
  scrollable = self.parent.children.buttonGroup.frame
  width = self.parent.frame.w
  center = width/2
  last_x = center
end

function update()
  now = getMillis()
  if (now - last < delay) or swiping or home then return end
  last = now
  getHome()
end

function getHome()
  local accel = math.fmod(math.abs(scrollable.x), width)
  if accel > center then accel = accel - width end
  accel = accel/center
  absAccel = math.abs(accel)
  absSpeed = math.abs(speed)
  if absSpeed > minSpeed*latched then
    slowDown()
  elseif absAccel > drag*latched then
    latched = 2
    speed = speed + accel*springiness
  else
    scrollable.x = -width
    latched = 1
    home = true
    return
  end
  pan(speed)
end

function slowDown()
  if speed == 0 then return end
  speed = speed - drag*speed
end

function pan(x)
  scrollable.x = scrollable.x + x
  -- wrap around
  if scrollable.x < -width*1.5 then
    scrollable.x = scrollable.x + width
    luaProcessor:notify('pagePlusDirectLoad')
  elseif scrollable.x > -width*0.5 then
    scrollable.x = scrollable.x - width
    luaProcessor:notify('pageMinusDirectLoad')
  end
end

function onPointer(pointers)
  local x = pointers[1].x
  local state = pointers[1].state
  local delta = math.floor(x-last_x)
  last_x = x
  if state == PointerState.BEGIN then
    swiping = true
    home = false
    latched = 1
    speed = 0
  elseif state == PointerState.MOVE then
    speed = delta
    pan(speed)
  elseif state == PointerState.END then
    swiping = false
  end
end
