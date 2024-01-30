TraitsRebalance = {}
local TRAIT_COST = {
    Graceful = 2,
    Dextrous = 4,
    Clumsy = -2,
	AdrenalineJunkie = 3,
    Organized = 4,
    LowThirst = 2,
    NightVision = 1,
	GenExp = 1,
	scrapwarrior = 0,
	Athletic = 20,
	Strong = 20,
	ThickSkinned = 5,
	Fit = 10,
	Stout = 8,
	Taut = 8,
	FastHealer = 3,
	Resilient = 2,
	IronGut = 2,
	ProneToIllness = -3,
	NeedsMoreSleep = 0,
	NeedLessSleep = 0,
	Inconspicuous = 2,
	Smoker = -4,
	Hemophobic = -5,
	Durabile = 4,
	Nimble = 4,
	StrongNimble = 8,
	SlowHealer = -6,
	HighThirst = -3,
	Illiterate = -6,
	Gunfan = 6,
	Gunfan2 = 12,
	PanicAttacks = 0,
	Insomniac = 0,
	Obese = -10,
	Overweight = -6,
	Feeble = -6,
	Weak = -10,
	["Out of Shape"] = -7,
	Cook = 4,
	Nutritionist = 4,
	Mushroomer = 8,
	AMTrapper = 3,
	["Very Underweight"] = -14,
	LightEater= 3,
	HeartyAppitite= -5,
	HeavilyBleedingWounds = -5,
	Underweight = -10,
	MSTAlcoholic = -10,
	SpeedDemon = 2,
	SundayDriver = -4,
 	Thinskinned = -4,
	MSTDepressive = 0,  
	MSTOptimist = 0,
	WeatherSensitive = 0,
	Slack = 0,
	Snorer = 0,
	Claustophobic = 0,
	Agoraphobic = 0,
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