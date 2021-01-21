mobs.behaviors = {}

function mobs.behaviors.activate(entity, behavior, dtime)
  entity.behavior.exit(entity, dtime)
  entity.behavior = behavior
  entity.behavior.enter(entity, dtime)
end
