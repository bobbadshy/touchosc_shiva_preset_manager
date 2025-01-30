---@diagnostic disable: lowercase-global, undefined-global, need-check-nil, inject-field, undefined-field
-- ##########
-- Config
-- #
-- Where to send page plus/minus notifications
local database = self.parent.parent.children.luaProcessor
-- How fast to slow down (0.01..0.1)
local drag = 0.05
-- How fast to snap back into position (1..10)
local springiness = 5
-- Pixel speed at which we start snapping into position (5..30)
local minSpeed = 15
-- #
-- ##########

local latched = 1
local last_x
local speed = 0
local swiping = false
local home = false
local delay = 25
local last = 0
local scrollable
local center
local width

function pagePlus()
  database:notify('pagePlus')
end

function pageMinus()
  database:notify('pageMinus')
end

function init()
  scrollable = self.parent.children.swipeable.frame
  width = self.frame.w
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
    pagePlus()
  elseif scrollable.x > -width*0.5 then
    scrollable.x = scrollable.x - width
    pageMinus()
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
