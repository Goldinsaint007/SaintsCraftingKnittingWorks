local function addTailorXP(amount, player)
  player:getXp():AddXP(Perks.Tailoring, amount);
  player:Say("recived " .. amount .. " tailoring xp");
end

local function addCarveXP(amount, player)
  if amount > 1 then
    addTailorXP(amount - 1, player);
  end

  player:getXp():AddXP(Perks.Woodwork, amount);
  player:Say("recived " .. amount .. " tailoring xp");
end

function Recipe.OnGiveXP.StitchCloth(recipe, ingredients, result, player)
  if recipe:getOriginalname() == "Stitch Small Cotton Cloth" then
    if player:getPerkLevel(Perks.Tailoring) <= 1 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 2 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
      addTailorXP(1, player);
    end
  elseif recipe:getOriginalname() == "Stitch Cotton Cloth" then
    if player:getPerkLevel(Perks.Tailoring) <= 1 then
      addTailorXP(4, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 2 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
      addTailorXP(1, player);
    end
  elseif recipe:getOriginalname() == "Stitch Big Cotton Cloth" then
    if player:getPerkLevel(Perks.Tailoring) <= 2 then
      addTailorXP(5, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
      addTailorXP(4, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
      addTailorXP(1, player);
    end
  elseif recipe:getOriginalname() == "Stitch Small Cotton Cloth Roll" then
    if player:getPerkLevel(Perks.Tailoring) <= 1 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 2 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
      addTailorXP(1, player);
    end
  elseif recipe:getOriginalname() == "Stitch Cotton Cloth Roll" then
    if player:getPerkLevel(Perks.Tailoring) <= 3 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
      addTailorXP(1, player);
    end
  elseif recipe:getOriginalname() == "Stitch Big Cotton Cloth Roll" then
    if player:getPerkLevel(Perks.Tailoring) <= 4 then
      addTailorXP(3, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
      addTailorXP(2, player);
    elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
      addTailorXP(1, player);
    end
  end
end

function Recipe.OnGiveXP.CarveClothRollStick(recipe, ingredients, result, player)
  local source_material = ingredients:get(0);

  if item:getType() == "TreeBranch" then
    if recipe:getOriginalname() == "Carve Short Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 1 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 2 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(1, player);
      end
    elseif recipe:getOriginalname() == "Carve Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 2 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
        addCarveXP(1, player);
      end
    elseif recipe:getOriginalname() == "Carve Long Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
        addCarveXP(1, player);
      end
    end
  elseif item:getType() == "Plank" then
    if recipe:getOriginalname() == "Carve Short Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(6, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(5, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 7 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 8 then
        addCarveXP(1, player);
      end
    elseif recipe:getOriginalname() == "Carve Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(7, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(6, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
        addCarveXP(5, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 7 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 8 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 9 then
        addCarveXP(1, player);
      end
    elseif recipe:getOriginalname() == "Carve Long Cloth Roll Stick" then
      if player:getPerkLevel(Perks.Tailoring) <= 3 then
        addCarveXP(8, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 4 then
        addCarveXP(7, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 5 then
        addCarveXP(6, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 6 then
        addCarveXP(5, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 7 then
        addCarveXP(4, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 8 then
        addCarveXP(3, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 9 then
        addCarveXP(2, player);
      elseif player:getPerkLevel(Perks.Tailoring) <= 10 then
        addCarveXP(1, player);
      end
    end
  end
end