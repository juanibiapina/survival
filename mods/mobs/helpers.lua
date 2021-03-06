mobs.helpers = {}

function mobs.helpers.get_node(pos, fallback)
  local node = minetest.get_node_or_nil(pos)

  return node or {name = fallback}
end

function mobs.helpers.is_day()
  local tod = minetest.get_timeofday() * 24000
  return tod > 4500 and tod < 19500
end

