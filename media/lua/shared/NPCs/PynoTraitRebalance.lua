TraitsRebalance = {}
local TRAIT_COST = {
	Athletic = 20,
	Strong = 20,
	ThickSkinned = 8,
	Fit = 10,
	Stout = 8,
	Taut = 8,
	FastHealer = 4,
	Resilient = 3,
	IronGut = 2,
	ProneToIllness = -3,
	NeedsMoreSleep = -2,
	Conspicuous = -2,
	Smoker = -4,
	Hemophobic = -4,
	Durabile = 4,
	Nimble = 4,
	StrongNimble = 8,
	SlowHealer = -4,
	HighThirst = -2,
	Illiterate = -6,
	Gunfan = 6,
	Gunfan2 = 12,
	PanicAttacks = 0,
	Insomniac = -2,
	Obese = -8,
	Overweight = -4,
	Feeble = -6,
	Weak = -10,
	["Out of Shape"] = -7,
	Cook = 5,
	Nutritionist = 2,
	Mushroomer = 10,
	Amtrapperdesc = 4,
	AMTrapper = 4,
	

	HeavilyBleedingWounds = -4,
	["Very Underweight"] = -12,
	Underweight = -8,
	MSTAlcoholic = -8,
	SpeedDemon = 2,
	SundayDriver = -4,
 	Thinskinned = -4,
	NeedLessSleep = 2,
	MSTDepressive = 0,
        MSTOptimist = 0,
	WeatherSensitive = 0,
	Slack = 0,
	Snorer = 0,
	Claustophobic = 3,
	Agoraphobic = 3,
	Accmetabolism = 0,
	MSTAllergic = -1,
	AMCook = 2,
	
	
	
	
	

}
TraitsRebalance.TRAIT_COST = TRAIT_COST

local PROF_COST = {
	fireofficer = -2,
	lumberjack = -2,
	fitnessInstructor = -8,
	engineer = 0,
	electrician = 0,

}
TraitsRebalance.PROF_COST = PROF_COST

local old_addTrait = TraitFactory.addTrait
TraitFactory.addTrait = function(name, trans, cost, ...)
	local new_cost = TRAIT_COST[name]
	if new_cost then
		cost = new_cost
	end
	return old_addTrait(name, trans, cost, ...)
end

local old_ProfessionFactory = ProfessionFactory.addProfession
ProfessionFactory.addProfession = function(name, t1, t2, cost, ...)
	local new_cost = PROF_COST[name]
	if new_cost then
		cost = new_cost
	end
	return old_ProfessionFactory(name, t1, t2, cost, ...)
end