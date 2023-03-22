require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

--New items

	local WeldingRod = {
        type = "Base.WeldingRod",
		skill = 1,
        xp = 15,
      
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=5, Farm=5, Vegitation=1, TownZone=1, TrailerPark=2 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 2, 12 },
       
       --altWorldTexture = getTexture("media/textures/Foraging/worldSprites/lemongrass_worldSprite.png"), 
	}

	local BkLaboratoryEquipment1 = {
        type = "LabBook.BkLaboratoryEquipment1",
		skill = 1,
        xp = 15,
        
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=15, Farm=15, Vegitation=1, TownZone=20, TrailerPark=2 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
		
	local BkVirologyCourses1 = {
        type = "LabBook.BkVirologyCourses1",
		skill = 3,
        xp = 15,
        
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=5, Farm=5, Vegitation=1, TownZone=10, TrailerPark=2 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
		
	local BkChemistryCourse = {
        type = "LabBook.BkChemistryCourse",
		skill = 4,
        xp = 15,
        
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=5, Farm=5, Vegitation=1, TownZone=10, TrailerPark=2 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },   
	}
		
	local Money = {
        type = "Base.Money",
		minCount = 1,
		maxCount =5,
		skill = 0,
        xp = 5,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=1, Farm=1, Vegitation=1, TownZone=5, TrailerPark=1 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },	
	}
		
	local XPMoneyStack = {
        type = "MoneyToXP.XPMoneyStack",
		skill = 8,
        xp = 5,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=1, Farm=1, Vegitation=1, TownZone=2, TrailerPark=1 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
		
	local Spiffo = {
        type = "Base.Spiffo",
		skill = 3,
        xp = 5,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { DeepForest=1, Forest=2, FarmLand=1, Farm=1, Vegitation=1, TownZone=2, TrailerPark=1 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
		
	local SpiffoBig = {
        type = "Base.SpiffoBig",
		skill = 9,
        xp = 10,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { FarmLand=1, Farm=1, Vegitation=1, TownZone=2 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
	
		
	local Hat_WoolyHatWaldo = {
        type = "AuthenticZClothing.Hat_WoolyHatWaldo",
		skill = 10,
        xp = 10,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { TownZone=1 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
	
		
	local PropaneTank = {
        type = "Base.PropaneTank",
		skill = 0,
        xp = 10,
		
        nightChance = 20, 
        categories = { "Junk" },
        zones = { FarmLand=1, Farm=1, Vegitation=1, TownZone=3 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
	
		
	local AssaultRifle = {
        type = "Base.AssaultRifle",
		skill = 8,
        xp = 10,
		
        nightChance = 20, 
		categories = { "Junk" },
        zones = { FarmLand=1, Farm=1, Vegitation=1, TownZone=3 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}
	
	local BeerBottle = {
        type = "Base.BeerBottle",
		skill = 1,
        xp = 10,
		
        nightChance = 20, 
		categories = { "Junk" },
        zones = { FarmLand=5, Farm=2, Vegitation=2, TownZone=10 },
        months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 12, 2 },
	}




forageSystem.addItemDef(WeldingRod);
forageSystem.addItemDef(BkLaboratoryEquipment1);
forageSystem.addItemDef(BkVirologyCourses1);
forageSystem.addItemDef(BkChemistryCourse);
forageSystem.addItemDef(Money);
forageSystem.addItemDef(XPMoneyStack);
forageSystem.addItemDef(Spiffo);
forageSystem.addItemDef(SpiffoBig);
forageSystem.addItemDef(Hat_WoolyHatWaldo);
forageSystem.addItemDef(PropaneTank);
forageSystem.addItemDef(AssaultRifle);
forageSystem.addItemDef(BeerBottle);

end)