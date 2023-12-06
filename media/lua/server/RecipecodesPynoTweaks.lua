function Recipe.OnGiveXP.Empty(recipe, ingredients, result, player)
	-- hehe hoho
end
function Recipe.OnGiveXP.RipLeather(recipe, ingredients, result, player)
	 player:getXp():AddXP(Perks.Tailoring, 1);
end

function Recipe.OnGiveXP.MakeEngineParts(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Mechanics, 5);
	player:getXp():AddXP(Perks.Electricity, 5);
end

function Recipe.OnGiveXP.MetalWelding2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 2);
end

function Recipe.OnCreate.RollMoney(items, result, player)
	player:getInventory():AddItems("Base.Money", ZombRand(5)+2);
end

function RollMoneyBag(items, result, player)
	player:getInventory():AddItems("Base.Money", ZombRand(20)+1);
end

function Recipe.OnCreate.RollWCoin(items, result, player)
	player:getInventory():AddItems("PynoTweaks.WCoin", ZombRand(3)+1);
end