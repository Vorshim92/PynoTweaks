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


-- balestra

TweakItem("KCMweapons.HandCrossbow","SoundRadius",30);
TweakItem("KCMweapons.KCM_Compound","SoundRadius",30);
TweakItem("KCMweapons.KCM_Handmade","SoundRadius",30);
TweakItem("KCMweapons.KCM_Handmade02","SoundRadius",30);
TweakItem("KCMweapons.KCM_Compound02","SoundRadius",30);

TweakItem("KCMweapons.HandCrossbow","HitChance",2);
TweakItem("KCMweapons.KCM_Compound","HitChance",2);
TweakItem("KCMweapons.KCM_Handmade","HitChance",2);
TweakItem("KCMweapons.KCM_Handmade02","HitChance",2);
TweakItem("KCMweapons.KCM_Compound02","HitChance",2);

TweakItem("KCMweapons.HandCrossbow","MaxRange",5);
TweakItem("KCMweapons.KCM_Compound","MaxRange",5);
TweakItem("KCMweapons.KCM_Handmade","MaxRange",5);
TweakItem("KCMweapons.KCM_Handmade02","MaxRange",5);
TweakItem("KCMweapons.KCM_Compound02","MaxRange",5);

TweakItem("KCMweapons.HandCrossbow","MinDamage",0.5);
TweakItem("KCMweapons.KCM_Compound","MinDamage",0.5);
TweakItem("KCMweapons.KCM_Handmade","MinDamage",0.5);
TweakItem("KCMweapons.KCM_Handmade02","MinDamage",0.5);
TweakItem("KCMweapons.KCM_Compound02","MinDamage",0.5);

TweakItem("KCMweapons.HandCrossbow","MaxDamage",0.8);
TweakItem("KCMweapons.KCM_Compound","MaxDamage",0.8);
TweakItem("KCMweapons.KCM_Handmade","MaxDamage",0.8);
TweakItem("KCMweapons.KCM_Handmade02","MaxDamage",0.8);
TweakItem("KCMweapons.KCM_Compound02","MaxDamage",0.8);


-- Luce del minatore
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","LightDistance",7);
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","LightStrength",1);
TweakItem("AuthenticZClothing.Authentic_MinerLightbulb","UseDelta",0.00055);

-- Spiffo
TweakItem("Base.SpiffoBig","Weight", 2);



--Radio
-------peso
TweakItem("Radio.WalkieTalkie1","Weight", 0.2);
TweakItem("Radio.WalkieTalkie2","Weight", 0.2);
TweakItem("Radio.WalkieTalkie3","Weight", 0.2);
TweakItem("Radio.WalkieTalkie4","Weight", 0.3);
TweakItem("Radio.WalkieTalkie5","Weight", 0.3);
TweakItem("Radio.WalkieTalkieMakeShift","Weight", 0.8);


----------consumo
TweakItem("Radio.WalkieTalkie1","UseDelta", 0.0002);
TweakItem("Radio.WalkieTalkie2","UseDelta", 0.0002);
TweakItem("Radio.WalkieTalkie3","UseDelta", 0.0002);
TweakItem("Radio.WalkieTalkie4","UseDelta", 0.0005);
TweakItem("Radio.WalkieTalkie5","UseDelta", 0.0005);
TweakItem("Radio.WalkieTalkieMakeShift","UseDelta", 0.0004);
TweakItem("Radio.HamRadio1","UseDelta", 0.00001);
TweakItem("Radio.HamRadio2","UseDelta", 0.00001);
TweakItem("Radio.HamRadioMakeShift","UseDelta", 0.00001);
TweakItem("Radio.RadioRed","UseDelta", 0.00001);
TweakItem("Radio.RadioBlack","UseDelta", 0.00001);
TweakItem("Radio.RadioMakeShift","UseDelta", 0.00001);

-------------cibo protein bar


TweakItem("EHE.ProteinBar","HungerChange", -10);
TweakItem("EHE.ProteinBar","UnhappyChange", -5);
TweakItem("EHE.ProteinBar","Calories", 25);


-------------cibo sushi

TweakItem("Base.SushiFish","HungerChange", -7);
TweakItem("Base.SushiFish","UnhappyChange", -15);
TweakItem("Base.SushiEgg","HungerChange", -7);
TweakItem("Base.SushiEgg","UnhappyChange", -15);

------- vitamine

TweakItem("Base.PillsVitamins","FatigueChange", -5);
TweakItem("Base.Ginseng","FatigueChange", -5);

---- cappello dello zio sam

TweakItem("AuthenticZLite.Hat_UncleSam","Weight", 40);





---- UCCELLACCI



TweakItem("Base.DeadBird","Weight", 0.6);



----- PESCI ESCA ECC

TweakItem("Base.BaitFish","Proteins", 4.0);
TweakItem("Base.FishStrips","Proteins", 25.0);
TweakItem("Base.DeadRabbit","Proteins", 220.0);







	
