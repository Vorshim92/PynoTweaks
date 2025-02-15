require("ItemTweaker_Main");

-- Max Condition
-- Default: 100  Max: int (2,147,483,647)
local max_condition = 2000000000

--Light Bulbs--
TweakItem("Base.LightBulb","ConditionMax",max_condition);
TweakItem("Base.LightBulbRed","ConditionMax",max_condition);
TweakItem("Base.LightBulbGreen","ConditionMax",max_condition);
TweakItem("Base.LightBulbBlue","ConditionMax",max_condition);
TweakItem("Base.LightBulbYellow","ConditionMax",max_condition);
TweakItem("Base.LightBulbCyan","ConditionMax",max_condition);
TweakItem("Base.LightBulbMagenta","ConditionMax",max_condition);
TweakItem("Base.LightBulbOrange","ConditionMax",max_condition);
TweakItem("Base.LightBulbPurple","ConditionMax",max_condition);
TweakItem("Base.LightBulbPink","ConditionMax",max_condition);

--GUNS--

TweakItem("Base.VarmintRifle","SoundRadius",250);
TweakItem("Base.Shotgun","SoundRadius",280);
TweakItem("Base.ShotgunSawnoff","SoundRadius",300);
TweakItem("Base.DoubleBarrelShotgun","SoundRadius",250);
TweakItem("Base.DoubleBarrelShotgunSawnoff","SoundRadius",280);
TweakItem("Base.Pisto","SoundRadius",100);
TweakItem("Base.Pistol2","SoundRadius",200);
TweakItem("Base.Pistol3","SoundRadius",140);
TweakItem("Base.Revolver","SoundRadius",100);
TweakItem("Base.Revolver_Long","SoundRadius",160);
TweakItem("Base.Revolver_Short","SoundRadius",70);
TweakItem("Base.AssaultRifle","SoundRadius",170);
TweakItem("Base.AssaultRifle2","SoundRadius",170);
TweakItem("Base.ShotgunSawnoffNoStock","SoundRadius",320);
TweakItem("Base.Spas12","SoundRadius",300);
TweakItem("Base.Spas12Folded","SoundRadius",300);
TweakItem("Base.AK47","SoundRadius",180);
TweakItem("Base.AK47Folded","SoundRadius",190);
TweakItem("Base.SKS","SoundRadius",250);
TweakItem("Base.1022","SoundRadius",170);
TweakItem("Base.Mini14","SoundRadius",200);
TweakItem("Base.Mini14Folded","SoundRadius",200);
TweakItem("Base.CAR15","SoundRadius",200);
TweakItem("Base.CAR15D","SoundRadius",120);
TweakItem("Base.HuntingRifle","SoundRadius",200);
TweakItem("Base.LeverRifle","SoundRadius",150);
TweakItem("Base.MP5","SoundRadius",150);
TweakItem("Base.MP5SD","SoundRadius",70);
TweakItem("Base.MP5SD","MaxRange",7);
TweakItem("Base.MP5SD","SoundRadius",70);




-- Luce del minatore
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","LightDistance",76);
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","LightStrength",1);
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","UseDelta",0.00055);

-- Spiffo
TweakItem("Base.SpiffoBig","Weight", 2);



--Radio
-------peso
TweakItem("Radio.WalkieTalkie1","Weight", 0.02);
TweakItem("Radio.WalkieTalkie2","Weight", 0.02);
TweakItem("Radio.WalkieTalkie3","Weight", 0.02);
TweakItem("Radio.WalkieTalkie4","Weight", 0.02);
TweakItem("Radio.WalkieTalkie5","Weight", 0.02);
TweakItem("Radio.WalkieTalkieMakeShift","Weight", 0.02);


----------consumo
TweakItem("Radio.WalkieTalkie1","UseDelta", 0.00002);
TweakItem("Radio.WalkieTalkie2","UseDelta", 0.00002);
TweakItem("Radio.WalkieTalkie3","UseDelta", 0.00002);
TweakItem("Radio.WalkieTalkie4","UseDelta", 0.00005);
TweakItem("Radio.WalkieTalkie5","UseDelta", 0.00005);
TweakItem("Radio.WalkieTalkieMakeShift","UseDelta", 0.00004);
TweakItem("Radio.HamRadio1","UseDelta", 0.000001);
TweakItem("Radio.HamRadio2","UseDelta", 0.000001);
TweakItem("Radio.HamRadioMakeShift","UseDelta", 0.000001);
TweakItem("Radio.RadioRed","UseDelta", 0.000001);
TweakItem("Radio.RadioBlack","UseDelta", 0.000001);
TweakItem("Radio.RadioMakeShift","UseDelta", 0.000001);

-------------cibo protein bar


TweakItem("EHE.ProteinBar","HungerChange", -10);
TweakItem("EHE.ProteinBar","UnhappyChange", -5);
TweakItem("EHE.ProteinBar","Calories", 25);
TweakItem("EHE.ProteinBar","Carbohydrates", 40);
TweakItem("EHE.ProteinBar","Lipids", 10);


-------------cibo sushi

TweakItem("Base.SushiFish","HungerChange", -7);
TweakItem("Base.SushiFish","UnhappyChange", -15);
TweakItem("Base.SushiEgg","HungerChange", -7);
TweakItem("Base.SushiEgg","UnhappyChange", -15);

------- vitamine

TweakItem("Base.PillsVitamins","FatigueChange", -5);
TweakItem("Base.Ginseng","FatigueChange", -5);

---- cappello dello zio sam

TweakItem("AuthenticZLite.Hat_UncleSam","Weight", 40.0);









----- PESCI ESCA ECC

TweakItem("Base.BaitFish","Proteins", 4.0);
TweakItem("Base.FishStrips","Proteins", 25.0);


----Armi scappabili
----- Lance
----- Savage spear
TweakItem("SWeapons.SpearSalvaged","ConditionLowerChanceOneIn", 10);
TweakItem("SWeapons.SpearSalvaged","ConditionMax", 30);
TweakItem("SWeapons.SpearSalvaged","MinDamage", 1.2);
TweakItem("SWeapons.SpearSalvaged","MaxDamage", 1.8);

----- Scarp spear
TweakItem("SWeapons.ScrapSpear","ConditionLowerChanceOneIn", 10);
TweakItem("SWeapons.ScrapSpear","ConditionMax", 25);
TweakItem("SWeapons.ScrapSpear","MinDamage", 1.0);
TweakItem("SWeapons.ScrapSpear","MaxDamage", 1.5);

----- Scarp spear
TweakItem("SWeapons.ScrapSpear","ConditionLowerChanceOneIn", 10);
TweakItem("SWeapons.ScrapSpear","ConditionMax", 25);
TweakItem("SWeapons.ScrapSpear","MinDamage", 1.0);
TweakItem("SWeapons.ScrapSpear","MaxDamage", 1.5);

----- Scarp spearMacete
TweakItem("SWeapons.SpearScrapMachete","ConditionLowerChanceOneIn", 8);
TweakItem("SWeapons.SpearScrapMachete","ConditionMax", 30);
TweakItem("SWeapons.SpearScrapMachete","MinDamage", 1.2);
TweakItem("SWeapons.SpearScrapMachete","MaxDamage", 1.7);

----- Scarp spearShiv
TweakItem("SWeapons.SpearScrapShiv","ConditionLowerChanceOneIn", 6);
TweakItem("SWeapons.SpearScrapShiv","ConditionMax", 20);
TweakItem("SWeapons.SpearScrapShiv","MinDamage", 0.9);
TweakItem("SWeapons.SpearScrapShiv","MaxDamage", 1.4);

----- Scarp SpearSharpenedScrewdriver
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionLowerChanceOneIn", 6);
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionMax", 20);
TweakItem("SWeapons.SpearSharpenedScrewdriver","MinDamage", 0.9);
TweakItem("SWeapons.SpearSharpenedScrewdriver","MaxDamage", 1.4);

----- Spade
----- SalvagedCleaver
TweakItem("SWeapons.SalvagedCleaver","ConditionLowerChanceOneIn", 14);
TweakItem("SWeapons.SalvagedCleaver","ConditionMax", 15);
TweakItem("SWeapons.SalvagedCleaver","MinDamage", 3);
TweakItem("SWeapons.SalvagedCleaver","MaxDamage", 6);

----- SalvagedMachete
TweakItem("SWeapons.SalvagedMachete","ConditionMax", 22);

----- SalvagedNightstick
TweakItem("SWeapons.SalvagedNightstick","Weight", 1.8);
TweakItem("SWeapons.SalvagedNightstick","MinDamage", 0.7);
TweakItem("SWeapons.SalvagedNightstick","MaxDamage", 1.5);

----- ScrapSword
TweakItem("SWeapons.ScrapSword","ConditionMax", 30);

----- Armi a una mano
------ ScrapClub
TweakItem("SWeapons.ScrapClub","ConditionLowerChanceOneIn", 20);
------ SalvagedClub
TweakItem("SWeapons.SalvagedClub","ConditionLowerChanceOneIn", 18);

----- Armi a due mani
------ SalvagedCrowbar
TweakItem("SWeapons.SalvagedCrowbar","MinDamage", 0.6);
TweakItem("SWeapons.SalvagedCrowbar","MaxDamage", 1.2);

----- BoltBat
TweakItem("SWeapons.BoltBat","MinDamage", 0.9);
TweakItem("SWeapons.BoltBat","MinDamage", 1.1);

-----ChainBat
TweakItem("SWeapons.ChainBat","MinDamage", 1.2);
TweakItem("SWeapons.ChainBat","MinDamage", 1.7);
TweakItem("SWeapons.ChainBat","BaseSpeed", 0.96);

-----SalvagedPipe
TweakItem("SWeapons.SalvagedPipe","ConditionLowerChanceOneIn", 30);

-----TinCanClub
TweakItem("SWeapons.TinCanClub","BaseSpeed", 0.75);

------GearMace
TweakItem("SWeapons.GearMace","BaseSpeed", 0.9);

------WireBat
TweakItem("SWeapons.WireBat","ConditionLowerChanceOneIn", 30);
TweakItem("SWeapons.WireBat","MinDamage", 0.8);
TweakItem("SWeapons.WireBat","MaxDamage", 1.3);

------Micromaul
TweakItem("SWeapons.Micromaul","ConditionLowerChanceOneIn", 10);
TweakItem("SWeapons.Micromaul","BaseSpeed", 0.75);

----- Asce
-----HugeScrapPickaxe
TweakItem("SWeapons.HugeScrapPickaxe","ConditionLowerChanceOneIn", 18);

------SalvagedPipeWrench
TweakItem("SWeapons.SalvagedPipeWrench","ConditionLowerChanceOneIn", 18);

-----TireIronAxe
TweakItem("SWeapons.TireIronAxe","ConditionLowerChanceOneIn", 12);

-------PipewithScissors
TweakItem("SWeapons.TireIronAxe","ConditionMax", 8);

----ScrapPickaxe
TweakItem("SWeapons.ScrapPickaxe","MinDamage", 0.6);
TweakItem("SWeapons.ScrapPickaxe","MaxDamage", 1.5);


------BigScrapPickaxe
TweakItem("SWeapons.BigScrapPickaxe","ConditionLowerChanceOneIn", 20);


        --- maschere

--- maschera da coniglio blu
TweakItem("Base.Hat_Rabbit_Blue","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit_Blue","BiteDefense", 0);

--- maschera da coniglio verde
TweakItem("Base.Hat_Rabbit_Green","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit_Green","BiteDefense", 0);

--- maschera da coniglio grigio
TweakItem("Base.Hat_Rabbit_Grey","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit_Grey","BiteDefense", 0);

--- maschera da coniglio viola
TweakItem("Base.Hat_Rabbit_Purple","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit_Purple","BiteDefense", 0);

--- maschera da coniglio rosso
TweakItem("Base.Hat_Rabbit","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit","BiteDefense", 0);

--- maschera da coniglio rosso
TweakItem("Base.Hat_Rabbit","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit","BiteDefense", 0);

--- maschera da coniglio rgiallo
TweakItem("Base.Hat_Rabbit_Yellow","ScratchDefense", 0);
TweakItem("Base.Hat_Rabbit_Yellow","BiteDefense", 0);

--- maschera da coniglio blu
TweakItem("Base.Hat_Blue","ScratchDefense", 0);
TweakItem("Base.Hat_Blue","BiteDefense", 0);

--- maschera da coniglio blu
TweakItem("Base.Hat_Blue","ScratchDefense", 0);
TweakItem("Base.Hat_Blue","BiteDefense", 0);



--- Liquidi drenanti e pillole varie consumo

TweakItem("Base.PillsAntiDep","UseDelta", 0.25);
TweakItem("Base.PillsSleepingTablets","UseDelta", 0.25);
TweakItem("Base.Pills","UseDelta", 0.25);
TweakItem("Base.PillsBeta","UseDelta", 0.25);
TweakItem("Base.PillsVitamins","UseDelta", 0.25);


--- riviste nerf 

-- rivista 
TweakItem("Base.Magazine","StressChange", -10);
TweakItem("Base.Magazine","BoredomChange", -15);

-- rivista tv
TweakItem("Base.TVMagazine","StressChange", -10);
TweakItem("Base.TVMagazine","BoredomChange", -15);

-- rivista cruciverba  1
TweakItem("Base.MagazineCrossword1","StressChange", -10);
TweakItem("Base.MagazineCrossword1","BoredomChange", -15);

-- rivista cruciverba  2
TweakItem("Base.MagazineCrossword2","StressChange", -10);
TweakItem("Base.MagazineCrossword2","BoredomChange", -15);

-- rivista cruciverba parole 3
TweakItem("Base.MagazineCrossword3","StressChange", -10);
TweakItem("Base.MagazineCrossword3","BoredomChange", -15);

-- rivista ricerca delle parole 1
TweakItem("Base.MagazineWordsearch1","StressChange", -10);
TweakItem("Base.MagazineWordsearch1","BoredomChange", -15);

-- rivista ricerca delle parole 2
TweakItem("Base.MagazineWordsearch2","StressChange", -10);
TweakItem("Base.MagazineWordsearch2","BoredomChange", -15);

-- rivista ricerca delle parole 3
TweakItem("Base.MagazineWordsearch3","StressChange", -10);
TweakItem("Base.MagazineWordsearch3","BoredomChange", -15);

---libro rosso
TweakItem("Base.Book","StressChange", -30);
TweakItem("Base.Book","BoredomChange", -30);
TweakItem("Base.Book","UnhappyChange", -25);

---libro comic
TweakItem("Base.ComicBook","StressChange", -20);
TweakItem("Base.ComicBook","BoredomChange", -20);
TweakItem("Base.ComicBook","UnhappyChange", -20);

---libro comic
TweakItem("Base.HottieZ","StressChange", -30);
TweakItem("Base.HottieZ","BoredomChange", -30);



--- slip di ferro

TweakItem("Trelai.ThickBoxers_Hearts","ScratchDefense", 1);
TweakItem("Trelai.ThickBoxers_Hearts","BiteDefense", 1);

-- mazza da baseball di ferro
TweakItem("SOMW.AluminumBaseballBat","Weight", 1.4);
TweakItem("SOMW.AluminumBaseballBat","ConditionLowerChanceOneIn", 20);
TweakItem("SOMW.AluminumBaseballBat","MinDamage", 0.7);
TweakItem("SOMW.AluminumBaseballBat","MaxDamage", 1.2);

--trelai mazza da baseball
TweakItem("Trelai.BaseballBatTrelai","Weight", 1.6);
TweakItem("Trelai.BaseballBatTrelai","ConditionLowerChanceOneIn", 30);
TweakItem("Trelai.BaseballBatTrelai","MinDamage", 0.8);
TweakItem("Trelai.BaseballBatTrelai","MaxDamage", 1.8);

--magik stik pitstop
TweakItem("Base.JeanBeanWand","Weight", 1.0);
TweakItem("Base.JeanBeanWand","ConditionLowerChanceOneIn", 10);
TweakItem("Base.JeanBeanWand","MinDamage", 0.8);
TweakItem("Base.JeanBeanWand","MaxDamage", 2.8);
TweakItem("Base.JeanBeanWand","MaxRange", 0.8);

-- Water Bottle Az

TweakItem("AuthenticZLite.AuthenticAquaBottle_Pink_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Green_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Blue_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Cyan_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Red_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Yellow_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Purple_full","UseDelta", 0.25);
TweakItem("AuthenticZLite.AuthenticAquaBottle_Orange_full","UseDelta", 0.25);

-- accendini e fiammiferi usi
TweakItem("Base.Lighter","UseDelta", 0.2);
TweakItem("Base.Lighter","ticksPerEquipUse",6200);
TweakItem("Base.Matches","UseDelta", 0.25);

--insetti
--[[
TweakItem("Base.AmericanLadyCaterpillar","Weight", 0.02);
TweakItem("Base.AmericanLadyCaterpillar","HungerChange", -1);
TweakItem("Base.BandedWoolyBearCaterpillar","Weight", 0.02);
TweakItem("Base.BandedWoolyBearCaterpillar","HungerChange", -1);
TweakItem("Base.Centipede","Weight", 0.02);
TweakItem("Base.Centipede","HungerChange", -1);
TweakItem("Base.Centipede2","Weight", 0.02);
TweakItem("Base.Centipede2","HungerChange", -1);
TweakItem("Base.Cockroach","Weight", 0.02);
TweakItem("Base.Cockroach","HungerChange", -1);
TweakItem("Base.Cricket","Weight", 0.02);
TweakItem("Base.Cricket","HungerChange", -1);
TweakItem("Base.Grasshopper","Weight", 0.02);
TweakItem("Base.Grasshopper","HungerChange", -1);
TweakItem("Base.Maggots","Weight", 0.02);
TweakItem("Base.Maggots","HungerChange", -1);
TweakItem("Base.Millipede","Weight", 0.02);
TweakItem("Base.Millipede","HungerChange", -1);
TweakItem("Base.Millipede2","Weight", 0.02);
TweakItem("Base.Millipede2","HungerChange", -1);
TweakItem("Base.MonarchCaterpillar","Weight", 0.02);
TweakItem("Base.MonarchCaterpillar","HungerChange", -3);
TweakItem("Base.Pillbug","Weight", 0.02);
TweakItem("Base.Pillbug","HungerChange", -1);
TweakItem("Base.Slug","Weight", 0.02);
TweakItem("Base.Slug","HungerChange", -1);
TweakItem("Base.Slug2","Weight", 0.02);
TweakItem("Base.Slug2","HungerChange", 1);
TweakItem("Base.SilkMothCaterpillar","Weight", 0.02);
TweakItem("Base.SilkMothCaterpillar","HungerChange", -3);
TweakItem("Base.Snail","Weight", 0.02);
TweakItem("Base.Snail","HungerChange", -2);
TweakItem("Base.Termites","Weight", 0.02);
TweakItem("Base.SawflyLarva","Weight", 0.02);
TweakItem("Base.SwallowtailCaterpillar","Weight", 0.02);
TweakItem("Base.SwallowtailCaterpillar","HungerChange", -2);
TweakItem("Base.Worm","Weight", 0.02);
]]--


--martello di pietra
TweakItem("Base.HammerStone","ConditionMax", 7);
TweakItem("Base.HammerStone","ConditionLowerChanceOneIn", 7);
TweakItem("Base.HammerStone","MinDamage", 0.4);
TweakItem("Base.HammerStone","MaxDamage", 0.8);

--corde di stracci
TweakItem("Base.SheetRope","Weight", 0.2);

--candela
TweakItem("Base.Candle","ticksPerEquipUse", 9200 );

--Lancia da asse di legno
TweakItem("SOMW.PlankSpear","ConditionLowerChanceOneIn", 2);
TweakItem("SOMW.PlankSpear","CriticalChance", 10);

--Lancia da asse di legno con pietra
TweakItem("SOMW.SpearChippedStone","ConditionLowerChanceOneIn", 4);
TweakItem("SOMW.SpearChippedStone","CriticalChance", 15);

--Lancia Base
TweakItem("Base.SpearCrafted","CriticalChance", 10);

-- lancia con forchetta
TweakItem("SOMW.PlankSpearHandFork","ConditionLowerChanceOneIn", 4);

-- lancia con coltello per pane
TweakItem("SOMW.PlankSpearBreadKnife","ConditionLowerChanceOneIn", 4);

--accetta di pietra
TweakItem("Base.AxeStone","ConditionLowerChanceOneIn", 5);
TweakItem("Base.AxeStone","ConditionMax", 6);

--cappello da russo
TweakItem("Base.UshankaHat","ScratchDefense", 100);
TweakItem("Base.UshankaHat","BiteDefense", 100);

--zaino rosa
TweakItem("Base.Bag_ALICEpack_Pink","WeightReduction", 85);
TweakItem("Base.Bag_ALICEpack_Pink","Capacity", 27);

--Batterie
TweakItem("Base.Battery","Weight", 0.02);


-- bomba fumogena
TweakItem("Base.SmokeBomb","Weight", 0.3);
TweakItem("Base.SmokeBomb","SmokeRange", 10);

-- Trapano La Resistenza Pack
TweakItem("Base.CordlessDrill","Weight", 1.0);
TweakItem("Base.CordlessDrill","MaxDamage", 0.8);
TweakItem("Base.CordlessDrill","MinDamage", 0.3);
TweakItem("Base.CordlessDrill","MinDamage", 0.3);
TweakItem("Base.CordlessDrill","ConditionMax", 10);

-- consumo di acqua innaffiatoio e tanica benza con acqua
TweakItem("Base.WateredCanFull","UseDelta", 0.0067);
TweakItem("Base.PetrolCanWater","UseDelta", 0.1125);

--[[pipebomb
TweakItem("Base.Aerosolbomb","ExplosionPower", 0);
TweakItem("Base.Aerosolbomb","ExplosionRange", 0);

TweakItem("Base.FlameTrap","ExplosionPower", 0);
TweakItem("Base.FlameTrap","ExplosionRange", 0);
TweakItem("Base.FlameTrap","FirePower", 0);
TweakItem("Base.FlameTrap","FireRange", 0);

TweakItem("Base.PipeBomb","ExplosionPower", 0);
TweakItem("Base.PipeBomb","ExplosionRange", 0);

TweakItem("AuthenticZLite.AuthenticPipeBomb","ExplosionPower", 0);
TweakItem("AuthenticZLite.AuthenticPipeBomb","ExplosionRange", 0);

TweakItem("Base.Molotov","ExplosionPower", 0);
TweakItem("Base.Molotov","ExplosionRange", 0);
--]]

-------------------- VESTITI VANILLA -------------------------------------

-------- Cappelli vanilla ------- BodyLocation = Hat,
--[[ TweakItem("Base.WeldingMask","BodyLocation", "Hat"); 
TweakItem("Base.Hat_Army","ScratchDefense", 100); 
TweakItem("Base.Hat_Army","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCap","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCap","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCap_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCap_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY_Red","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapKY_Red","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapBlue","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapBlue","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapBlue_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapBlue_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapRed","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapRed","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapRed_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapRed_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapGreen","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapGreen","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapGreen_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapGreen_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapArmy","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapArmy","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballCapArmy_Reverse","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballCapArmy_Reverse","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_KY","CombatSpeedModifier",  1.0);
TweakItem("Base.Hat_BaseballHelmet_KY","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_KY","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_Rangers","CombatSpeedModifier",  1.0);
TweakItem("Base.Hat_BaseballHelmet_Rangers","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_Rangers","BiteDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_Z","CombatSpeedModifier",  1.0);
TweakItem("Base.Hat_BaseballHelmet_Z","ScratchDefense", 100); 
TweakItem("Base.Hat_BaseballHelmet_Z","BiteDefense", 100); 
TweakItem("Base.Hat_Beany","ScratchDefense", 100); 
TweakItem("Base.Hat_Beany","BiteDefense", 100); 
TweakItem("Base.Hat_Beret","ScratchDefense", 100); 
TweakItem("Base.Hat_Beret","BiteDefense", 100); 
TweakItem("Base.Hat_BeretArmy","ScratchDefense", 100); 
TweakItem("Base.Hat_BeretArmy","BiteDefense", 100); 
TweakItem("Base.Hat_BicycleHelmet","ScratchDefense", 100); 
TweakItem("Base.Hat_BicycleHelmet","ScratchDefense", 100); 
TweakItem("Base.Hat_BicycleHelmet","BiteDefense", 100); 
TweakItem("Base.Hat_ChefHat","ScratchDefense", 100); 
TweakItem("Base.Hat_ChefHat","BiteDefense", 100); 
TweakItem("Base.Hat_Cowboy","ScratchDefense", 100); 
TweakItem("Base.Hat_Cowboy","BiteDefense", 100); 
TweakItem("Base.Hat_CrashHelmet","ScratchDefense", 100); 
TweakItem("Base.Hat_CrashHelmet","BiteDefense", 100); 
TweakItem("Base.Hat_CrashHelmetFULL","ScratchDefense", 100); 
TweakItem("Base.Hat_CrashHelmetFULL","BiteDefense", 100); 
TweakItem("Base.Hat_CrashHelmet_Police","ScratchDefense", 100); 
TweakItem("Base.Hat_CrashHelmet_Police","BiteDefense", 100); 
TweakItem("Base.Hat_CrashHelmet_Stars","ScratchDefense", 100); 
TweakItem("Base.Hat_CrashHelmet_Stars","BiteDefense", 100); 
TweakItem("Base.Hat_EarMuffs","ScratchDefense", 100); 
TweakItem("Base.Hat_EarMuffs","BiteDefense", 100); 
TweakItem("Base.Hat_EarMuff_Protectors","ScratchDefense", 100); 
TweakItem("Base.Hat_EarMuff_Protectors","BiteDefense", 100); 
TweakItem("Base.Hat_FastFood","ScratchDefense", 100); 
TweakItem("Base.Hat_FastFood","BiteDefense", 100); 
TweakItem("Base.Hat_FastFood_IceCream","ScratchDefense", 100); 
TweakItem("Base.Hat_FastFood_IceCream","BiteDefense", 100); 
TweakItem("Base.Hat_FastFood_Spiffo","ScratchDefense", 100); 
TweakItem("Base.Hat_FastFood_Spiffo","BiteDefense", 100); 
TweakItem("Base.Hat_Fedora","ScratchDefense", 100); 
TweakItem("Base.Hat_Fedora","BiteDefense", 100); 
TweakItem("Base.Hat_Fedora_Delmonte","ScratchDefense", 100); 
TweakItem("Base.Hat_Fedora_Delmonte","BiteDefense", 100); 
TweakItem("Base.Hat_Fireman","ScratchDefense", 100); 
TweakItem("Base.Hat_Fireman","BiteDefense", 100); 
TweakItem("Base.Hat_FootballHelmet","ScratchDefense", 100); 
TweakItem("Base.Hat_FootballHelmet","BiteDefense", 100); 

--- giacchetti vanilla ---

TweakItem("Base.WeddingJacket", "CombatSpeedModifier", 0.95); 
TweakItem("Base.WeddingJacket", "RunSpeedModifier", 0.97);
TweakItem("Base.Ghillie_Top", "CombatSpeedModifier", 1.0);
TweakItem("Base.Ghillie_Top", "RunSpeedModifier", 0.97);
TweakItem("Base.Suit_Jacket", "CombatSpeedModifier", 1.0);
TweakItem("Base.Suit_Jacket", "RunSpeedModifier", 1.0);
TweakItem("Base.Suit_JacketTINT", "CombatSpeedModifier", 0.98);
TweakItem("Base.Suit_JacketTINT", "RunSpeedModifier", 1.0);
TweakItem("Base.JacketLong_Doctor", "CombatSpeedModifier", 0.99);
TweakItem("Base.JacketLong_Doctor", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_CoatArmy", "RunSpeedModifier", 1.0);
TweakItem("Base.JacketLong_Random", "CombatSpeedModifier", 0.98);
TweakItem("Base.JacketLong_Random", "RunSpeedModifier", 1.0);
TweakItem("Base.JacketLong_Santa", "CombatSpeedModifier", 0.98);
TweakItem("Base.JacketLong_Santa", "RunSpeedModifier", 1.0);
TweakItem("Base.JacketLong_SantaGreen", "CombatSpeedModifier", 0.98);
TweakItem("Base.JacketLong_SantaGreen", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_ArmyCamoDesert", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_ArmyCamoDesert", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_ArmyCamoGreen", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_ArmyCamoGreen", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_Black", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_Black", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_Chef", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_Chef", "RunSpeedModifier", 0.99);
TweakItem("Base.Jacket_Fireman", "CombatSpeedModifier", 0.97);
TweakItem("Base.Jacket_Fireman", "RunSpeedModifier", 0.95);
TweakItem("Base.Jacket_Padded", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_Padded", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_PaddedDOWN", "CombatSpeedModifier", 0.99);
TweakItem("Base.Jacket_PaddedDOWN", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_Police", "CombatSpeedModifier", 0.99);
TweakItem("Base.Jacket_Police", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_Ranger", "CombatSpeedModifier", 1.0);
TweakItem("Base.Jacket_Ranger", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_WhiteTINT", "RunSpeedModifier", 1.0);
TweakItem("Base.PonchoGreen", "RunSpeedModifier", 1.0);
TweakItem("Base.PonchoGreenDOWN", "RunSpeedModifier", 1.0);
TweakItem("Base.PonchoYellow", "RunSpeedModifier", 1.0);
TweakItem("Base.PonchoYellowDOWN", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_NavyBlue", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_LeatherWildRacoons", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_LeatherIronRodent", "RunSpeedModifier", 1.0);
TweakItem("Base.Jacket_LeatherBarrelDogs", "RunSpeedModifier", 1.0);

----- suit vanilla -----
---TweakItem("Base.LongCoat_Bathrobe", "RunSpeedModifier", 0.9);

TweakItem("Base.SpiffoSuit", "RunSpeedModifier", 0.98);
TweakItem("Base.HazmatSuit", "CombatSpeedModifier", 0.90);
TweakItem("Base.HazmatSuit", "RunSpeedModifier", 0.75);
TweakItem("Base.Boilersuit", "RunSpeedModifier", 1.0);
TweakItem("Base.Boilersuit_BlueRed", "RunSpeedModifier", 1.0);
TweakItem("Base.Boilersuit_Yellow", "RunSpeedModifier", 1.0);
TweakItem("Base.Boilersuit_Flying", "RunSpeedModifier", 1.0);
TweakItem("Base.Boilersuit_Prisoner", "RunSpeedModifier", 1.0);
TweakItem("Base.Boilersuit_PrisonerKhaki", "RunSpeedModifier", 1.0);
TweakItem("Base.Dress_Long", "RunSpeedModifier", 1.0);
TweakItem("Base.Dress_long_Straps", "RunSpeedModifier", 1.0);
TweakItem("Base.Dress_Normal", "RunSpeedModifier", 1.0);
TweakItem("Base.Dress_Straps", "RunSpeedModifier", 1.0);
TweakItem("Base.WeddingDress", "RunSpeedModifier", 0.95);

--- scarpe vanilla --

TweakItem("Base.Shoes_ArmyBoots", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_ArmyBootsDesert", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_Black", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_BlackBoots", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_BlueTrainers", "RunSpeedModifier", 1.02);
TweakItem("Base.Shoes_BlueTrainers", "ConditionMax ", 12);
TweakItem("Base.Shoes_Brown", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_Random", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_RedTrainers", "RunSpeedModifier", 1.02);
TweakItem("Base.Shoes_RedTrainers", "ConditionMax ", 12);
TweakItem("Base.Shoes_RidingBoots", "RunSpeedModifier", 0.98);
TweakItem("Base.Shoes_Slippers", "RunSpeedModifier", 0.7);
TweakItem("Base.Shoes_TrainerTINT", "RunSpeedModifier", 1.02);
TweakItem("Base.Shoes_TrainerTINT", "ConditionMax ", 12);
TweakItem("Base.Shoes_Wellies", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_FlipFlop", "RunSpeedModifier", 0.98);
TweakItem("Base.Shoes_Bowling", "RunSpeedModifier", 0.98);
TweakItem("Base.Shoes_Fancy", "RunSpeedModifier", 1.0);
TweakItem("Base.Shoes_Sandals", "RunSpeedModifier", 0.99);
TweakItem("Base.Shoes_Strapped", "RunSpeedModifier", 1.0); ]]--






