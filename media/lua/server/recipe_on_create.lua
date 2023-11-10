function Recipe.OnCreate.CutClothing21(items, result, player, selectedItem)
  local item = items:get(0) -- assumes any tool comes after this in recipes.txt
  local tool = items:get(1)

  local toolMultiplier = 0;
  -- get the tool type and then set multiplier based on the type of tool
  if tool:hasTag("Scissors") then
    toolMultiplier = 3;
  elseif tool:hasTag("SharpKnife") then
    toolMultiplier = 2;
  elseif tool:hasTag("DullKnife") then
    toolMultiplier = 1;
  end

  -- either we come from clothingrecipesdefinitions or we simply check number of covered parts by the clothing and add
  local materials = nil
  local nbrOfCoveredParts = nil
  local maxTime = 0 -- TODO: possibly allow recipe to call Lua function to get maxTime for actions

  if ClothingRecipesDefinitions[item:getType()] then
    local recipe = ClothingRecipesDefinitions[item:getType()]
    materials = luautils.split(recipe.materials, ":");
    maxTime = tonumber(materials[2]) * 20;
  elseif ClothingRecipesDefinitions["FabricType"][item:getFabricType()] then
    materials = {};
    materials[1] = ClothingRecipesDefinitions["FabricType"][item:getFabricType()].material;
    nbrOfCoveredParts = item:getNbrOfCoveredParts();
    local minMaterial = 2;
    local maxMaterial = nbrOfCoveredParts;

    if nbrOfCoveredParts == 1 then
      minMaterial = 1;
    end

    local nbr = ZombRand(minMaterial, maxMaterial + 1);
    nbr = nbr + (player:getPerkLevel(Perks.Tailoring) / 2);

    if nbr > nbrOfCoveredParts then
      nbr = nbrOfCoveredParts;
    end

    materials[2] = nbr;
    maxTime = nbrOfCoveredParts * 20;
  else
    error "Recipe.OnCreate.CutClothing"
  end

  for i=1,tonumber(materials[2]) + toolMultiplier do
    local item2;
    local dirty = false;

    if instanceof(item, "Clothing") then
      dirty = (ZombRand(100) <= item:getDirtyness()) or (ZombRand(100) <= item:getBloodlevel());
    end

    if not dirty then
      item2 = InventoryItemFactory.CreateItem(materials[1]);
    elseif getScriptManager():FindItem(materials[1] .. "Dirty") then
      item2 = InventoryItemFactory.CreateItem(materials[1] .. "Dirty");
    else
      item2 = InventoryItemFactory.CreateItem(materials[1])
    end

    player:getInventory():AddItem(item2);
  end

  -- add thread sometimes, depending on tailoring level
  if ZombRand(4) < player:getPerkLevel(Perks.Tailoring) + 1 then
    local max = 2;
    
    if nbrOfCoveredParts then
      max = nbrOfCoveredParts;

      if max > 6 then
        max = 6;
      end
    end

    max = ZombRand(2, max);
    local thread = InventoryItemFactory.CreateItem("Base.Thread");

    for i=1,10-max do
      thread:Use();
    end

    player:getInventory():AddItem(thread);
    player:getXp():AddXP(Perks.Tailoring, 1);
  end
end