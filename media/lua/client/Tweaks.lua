require("ItemTweaker_Main");

-- Max Condition
-- Default: 100  Max: int (2,147,483,647)
max_condition = 2000000000

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

TweakItem("AuthenticZLite.Hat_UncleSam","Weight", 1.0);









----- PESCI ESCA ECC

TweakItem("Base.BaitFish","Proteins", 4.0);
TweakItem("Base.FishStrips","Proteins", 25.0);


----Armi scappabili
----- Lance
----- Savage spear
TweakItem("SWeapons.SpearSalvaged","ConditionLowerChanceOneIn", 5);
TweakItem("SWeapons.SpearSalvaged","ConditionMax", 10);
TweakItem("SWeapons.SpearSalvaged","MinDamage", 1.2);
TweakItem("SWeapons.SpearSalvaged","MaxDamage", 1.8);

----- Scarp spear
TweakItem("SWeapons.ScrapSpear","ConditionLowerChanceOneIn", 3);
TweakItem("SWeapons.ScrapSpear","ConditionMax", 8);
TweakItem("SWeapons.ScrapSpear","MinDamage", 1.0);
TweakItem("SWeapons.ScrapSpear","MaxDamage", 1.5);

----- Scarp spear
TweakItem("SWeapons.ScrapSpear","ConditionLowerChanceOneIn", 3);
TweakItem("SWeapons.ScrapSpear","ConditionMax", 8);
TweakItem("SWeapons.ScrapSpear","MinDamage", 1.0);
TweakItem("SWeapons.ScrapSpear","MaxDamage", 1.5);

----- Scarp spearMacete
TweakItem("SWeapons.SpearScrapMachete","ConditionLowerChanceOneIn", 4);
TweakItem("SWeapons.SpearScrapMachete","ConditionMax", 10);
TweakItem("SWeapons.SpearScrapMachete","MinDamage", 1.2);
TweakItem("SWeapons.SpearScrapMachete","MaxDamage", 1.7);

----- Scarp spearShiv
TweakItem("SWeapons.SpearScrapShiv","ConditionLowerChanceOneIn", 3);
TweakItem("SWeapons.SpearScrapShiv","ConditionMax", 6);
TweakItem("SWeapons.SpearScrapShiv","MinDamage", 0.9);
TweakItem("SWeapons.SpearScrapShiv","MaxDamage", 1.4);

----- Scarp SpearSharpenedScrewdriver
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionLowerChanceOneIn", 3);
TweakItem("SWeapons.SpearSharpenedScrewdriver","ConditionMax", 6);
TweakItem("SWeapons.SpearSharpenedScrewdriver","MinDamage", 0.9);
TweakItem("SWeapons.SpearSharpenedScrewdriver","MaxDamage", 1.4);

----- Spade
----- SalvagedCleaver
TweakItem("SWeapons.SalvagedCleaver","ConditionLowerChanceOneIn", 6);
TweakItem("SWeapons.SalvagedCleaver","ConditionMax", 15);
TweakItem("SWeapons.SalvagedCleaver","MinDamage", 3);
TweakItem("SWeapons.SalvagedCleaver","MaxDamage", 6);

----- SalvagedMachete
TweakItem("SWeapons.SalvagedMachete","ConditionConditionMax", 12);

----- SalvagedNightstick
TweakItem("SWeapons.SalvagedNightstick","Weight", 1.8);
TweakItem("SWeapons.SalvagedNightstick","MinDamage", 0.7);
TweakItem("SWeapons.SalvagedNightstick","MaxDamage", 1.5);

----- ScrapSword
TweakItem("SWeapons.ScrapSword","ConditionMax", 12);

----- Armi a una mano
------ ScrapClub
TweakItem("SWeapons.ScrapClub","ConditionLowerChanceOneIn", 20);
------ SalvagedClub
TweakItem("SWeapons.SalvagedClub","ConditionLowerChanceOneIn", 18);

----- Armi a due mani
------ SalvagedCrowbar
TweakItem("SWeapons.SalvagedCrowbar","MinDamage", 0.5);
TweakItem("SWeapons.SalvagedCrowbar","MaxDamage", 1.0);

----- BoltBat
TweakItem("SWeapons.BoltBat","MinDamage", 0.7);
TweakItem("SWeapons.BoltBat","MinDamage", 0.9);

-----ChainBat
TweakItem("SWeapons.ChainBat","MinDamage", 1.2);
TweakItem("SWeapons.ChainBat","MinDamage", 1.7);
TweakItem("SWeapons.ChainBat","BaseSpeed", 0.8);

-----SalvagedPipe
TweakItem("SWeapons.SalvagedPipe","ConditionLowerChanceOneIn", 8);

-----TinCanClub
TweakItem("SWeapons.TinCanClub","BaseSpeed", 0.75);

------GearMace
TweakItem("SWeapons.GearMace","BaseSpeed", 0.8);

------WireBat
TweakItem("SWeapons.WireBat","ConditionLowerChanceOneIn", 8);
TweakItem("SWeapons.WireBat","MinDamage", 0.8);
TweakItem("SWeapons.WireBat","MaxDamage", 1.3);

------Micromaul
TweakItem("SWeapons.Micromaul","ConditionLowerChanceOneIn", 5);
TweakItem("SWeapons.Micromaul","BaseSpeed", 0.75);

----- Asce
-----HugeScrapPickaxe
TweakItem("SWeapons.HugeScrapPickaxe","ConditionLowerChanceOneIn", 5);

------SalvagedPipeWrench
TweakItem("SWeapons.SalvagedPipeWrench","ConditionLowerChanceOneIn", 5);

-----TireIronAxe
TweakItem("SWeapons.TireIronAxe","ConditionLowerChanceOneIn", 7);

-------PipewithScissors
TweakItem("SWeapons.TireIronAxe","ConditionMax", 8);

----ScrapPickaxe
TweakItem("SWeapons.ScrapPickaxe","MinDamage", 0.6);
TweakItem("SWeapons.ScrapPickaxe","MaxDamage", 1.5);


------BigScrapPickaxe
TweakItem("SWeapons.BigScrapPickaxe","ConditionLowerChanceOneIn", 5);


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
TweakItem("Base.Lighter","UseDelta", 0.125);
TweakItem("Base.Lighter","ticksPerEquipUse",6200);
TweakItem("Base.Matches","UseDelta", 0.20);

--insetti
TweakItem("Base.AmericanLadyCaterpillar","Weight", 0.02);
TweakItem("Base.BandedWoolyBearCaterpillar","Weight", 0.02);
TweakItem("Base.Centipede","Weight", 0.02);
TweakItem("Base.Centipede2","Weight", 0.02);
TweakItem("Base.CCockroach","Weight", 0.02);
TweakItem("Base.Cricket","Weight", 0.02);
TweakItem("Base.Grasshopper","Weight", 0.02);
TweakItem("Base.Maggots","Weight", 0.02);
TweakItem("Base.Centipede2","Weight", 0.02);
TweakItem("Base.Millipede","Weight", 0.02);
TweakItem("Base.Millipede2","Weight", 0.02);
TweakItem("Base.MonarchCaterpillar","Weight", 0.02);
TweakItem("Base.Pillbug","Weight", 0.02);
TweakItem("Base.Slug","Weight", 0.02);
TweakItem("Base.Slug2","Weight", 0.02);
TweakItem("Base.SilkMothCaterpillar","Weight", 0.02);
TweakItem("Base.Snail","Weight", 0.02);
TweakItem("Base.Termites","Weight", 0.02);
TweakItem("Base.SawflyLarva","Weight", 0.02);
TweakItem("Base.SwallowtailCaterpillar","Weight", 0.02);
TweakItem("Base.Worm","Weight", 0.02);

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


-- Lancia fumogena
TweakItem("Base.SmokeBomb","SmokeRange", 50);
TweakItem("Base.SmokeBomb","Weight", 0.3);
TweakItem("Base.SmokeBomb","MaxDamage", 5.0);





