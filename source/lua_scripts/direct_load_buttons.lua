---@diagnostic disable: lowercase-global
local presetModule = self.parent.parent.parent.children
local swipeGroup = self.parent.parent
local last = 0
local moved = false

-- function onPointer(pointers)
--   local now = getMillis()
--   -- if pointers[1].state == PointerState.BEGIN then
--   --   last = now
--   -- end
--   --   moved = false
--   --   swipeGroup:notify('begin', self.pointers[1].x)
--   -- elseif pointers[1].state == PointerState.MOVE then
--   --   swipeGroup:notify('move', self.pointers[1].x)
--   --   last = now
--   --   moved = true
--   -- elseif pointers[1].state == PointerState.ACTIVE then
--   --   swipeGroup:notify('begin', self.pointers[1].x)
--   -- elseif pointers[1].state == PointerState.END then
--   --   swipeGroup:notify('end', self.pointers[1].x)
--   -- end
--   if self.values.touch and not moved then
--     if (
--       now - self.pointers[1].created > 1000 and
--       now - last > 1000
--     ) then
--       last = now +1000
--       presetModule.luaProcessor:notify('longTap', self.tag)
--     end
--   end
-- end

function onValueChanged(k)
  if k == 'touch' and not (moved or self.values.touch) then
    presetModule.luaProcessor:notify('directSelect', self.tag)
  end
end