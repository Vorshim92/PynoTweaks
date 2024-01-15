require("farming_vegetableconf")

farming_vegetableconf = farming_vegetableconf or {};

local function TweakSeedsRequirment(_,_,_,_)
    farming_vegetableconf.props["Carrots"].seedsRequired = 12 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Broccoli"].seedsRequired = 6 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Radishes"].seedsRequired = 6 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Strawberry plant"].seedsRequired = 12 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Tomato"].seedsRequired = 4 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Potatoes"].seedsRequired = 4 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
    farming_vegetableconf.props["Cabbages"].seedsRequired = 9 * SandboxVars.PynoTweaks.SeedsRequiredMultiplier;
end

Events.OnFillWorldObjectContextMenu.Add(TweakSeedsRequirment);