---@diagnostic disable: lowercase-global, undefined-global, need-check-nil, inject-field, undefined-field
-- ##########
-- Config
-- #
-- Where to send page plus/minus notifications
local database = self.parent.parent.children.luaProcessor
-- How fast to slow down (0.01..0.1)
local drag = 0.05
-- How fast to snap back into position (1..10)
local springiness = 7
-- Pixel speed at which we start snapping into position (5..30)
local minSpeed = 20
-- #
-- ##########

local latched = 1
local last_pos
local speed = 0
local swiping = false
local swiped = false
local home = false
local delay = 30
local last = 0
local tapped = false
local swipe
local swipeFrame
local buttons
local center
local width

function pagePlus()
  database:notify('pagePlusDirectLoad')
end

function pageMinus()
  database:notify('pageMinusDirectLoad')
end

function init()
  swipe = self.parent.children.swipeable
  swipeFrame = swipe.frame
  buttons = {}
  for i=1,#swipe.children do
    if swipe.children[i].type == ControlType.BUTTON then
      table.insert(buttons, swipe.children[i])
    end
  end
  width = self.frame.w
  center = width/2
  last_pos = {x = center, y = self.frame.h/2}
end

function update()
  local now = getMillis()
  if (now - last < delay) or swiping or home then return end
  last = now
  getHome()
end

function onValueChanged(k)
  if k ~= 'touch' or self.values.touch or swiped or tapped then return end
  triggerButton('directSelect')
end

function triggerButton(cmd)
  for i = 1,#buttons do
    if buttons[i].frame:contains(last_pos.x + width, last_pos.y) then
      database:notify(cmd, buttons[i].tag)
      break
    end
  end
end

function getHome()
  local accel = math.fmod(math.abs(swipeFrame.x), width)
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
    swipeFrame.x = -width
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
  swipeFrame.x = swipeFrame.x + x
  -- wrap around
  if swipeFrame.x < -width*1.5 then
    swipeFrame.x = swipeFrame.x + width
    pagePlus()
  elseif swipeFrame.x > -width*0.5 then
    swipeFrame.x = swipeFrame.x - width
    pageMinus()
  end
end

function onPointer(pointers)
  local state = pointers[1].state
  local delta = math.floor(pointers[1].x - last_pos.x)
  last_pos = { x = pointers[1].x, y = pointers[1].y }
  if state == PointerState.BEGIN then
    swiped = false
    swiping = true
    home = false
    tapped = false
    latched = 1
    speed = 0
  elseif state == PointerState.MOVE then
    speed = delta
    if math.abs(speed) > 1 then swiped = true end
    pan(speed)
  elseif state == PointerState.END then
    swiping = false
  end
  if self.values.touch and not swiped then
    if getMillis() - self.pointers[1].created > 1000 and not tapped then
      tapped = true
      triggerButton('longTap')
    end
  end
end
