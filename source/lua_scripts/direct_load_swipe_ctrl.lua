---@diagnostic disable: lowercase-global, undefined-global, need-check-nil, inject-field, undefined-field
local luaProcessor = self.parent.parent.children.luaProcessor
local drag = 5
local last_x
local speed = 0
local swiping = false
local rolling = true
local home = false
local delay = 25
local last = 0
local scrollable
local parent

function init()
  scrollable = self.parent.children.buttonGroup.frame
  parent = self.parent.frame
  last_x = parent.w / 2
end

function update()
  now = getMillis()
  if (now - last < delay) or swiping or home then return end
  last = now
  getHome()
end

function getHome()
  local width = parent.w
  local center = width/2
  local accel = math.fmod(math.abs(scrollable.x), parent.w)
  if accel > center then accel = accel - width end
  accel = accel/center*20
  if accel > drag/10 then
    if speed < -accel and rolling then
      slowDown()
    elseif math.abs(speed) < accel then
      speed = speed+accel/10
      rolling = false
    end
    if not rolling and speed > 0 then
      speed = math.max(drag, math.min(accel, speed))
    end
  elseif accel < -drag/10 then
    if speed > -accel and rolling then
      slowDown()
    elseif math.abs(speed) < -accel then
      speed = speed+accel/10
      rolling = false
    end
    if not rolling and speed < 0 then
      speed = math.min(-drag, math.max(accel, speed))
    end
  elseif math.abs(speed) < drag*2 then
    scrollable.x = -width
    home = true
    return
  end
  pan(speed)
end

function slowDown()
  if speed == 0 then return end
  speed = speed < 0 and speed+drag or speed-drag
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