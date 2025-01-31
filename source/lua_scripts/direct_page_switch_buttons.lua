local presetModule = self.parent.parent.children
local last = 0
local delay = 350
local rep = 80
local d

function onValueChanged(k)
  if k == 'touch' and self.values.touch then
    presetModule.luaProcessor:notify(self.name, self.tag)
    d = delay
  end
end

function onPointer()
  local now = getMillis()
  if self.values.touch then
    if (
      now - self.pointers[1].created > d and
      now - last > d
    ) then
      d = rep
      last = now + d
      presetModule.luaProcessor:notify(self.name, self.tag)
    end
  end
end