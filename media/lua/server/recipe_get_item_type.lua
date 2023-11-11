-- Code copied from server/recipecode/RipClothing.lua
local function RipClothing_GetItemTypes_XXX(scriptItems, fabricType)
    if not ClothingRecipesDefinitions["FabricType"][fabricType] then
        return
    end
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
        if (scriptItem:getType() == Type.Clothing) and (scriptItem:getFabricType() == fabricType) then
            if ClothingRecipesDefinitions[scriptItem:getName()] then
                -- ignore
            else
                scriptItems:add(scriptItem)
            end
        end
    end
end

function Recipe.GetItemTypes.RipClothing_Linen(scriptItems)
  RipClothing_GetItemTypes_XXX(scriptItems, "Linen")
end

