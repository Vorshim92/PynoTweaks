require "Foraging/ISSearchWindow"

function ISSearchWindow:updateSearchFocusCategories()
	self.searchFocus:clear();
	--the first option is always no focus
	self.searchFocus:addOptionWithData(getText("UI_search_mode_no_focus"), "None");

	--if the category is no longer available (by changing perk level) reset to no focus
	self.searchFocus.selected = 1;
	self.searchFocusCategory = "None";
end