

--- Adjust N.E. Building spawners to N.E. Enemy Settings
if mods["Natural_Evolution_Enemies"] then

	-- Remove Alerts from units. - NE Enemies
	data.raw["unit"]["small-biter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["small-biter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["medium-biter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["medium-biter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["big-biter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["big-biter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["small-spitter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["small-spitter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["medium-spitter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["medium-spitter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["big-spitter-Mk2"].alert_when_attacking = false
	data.raw["unit"]["big-spitter-Mk3"].alert_when_attacking = false
	data.raw["unit"]["small-biter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["small-biter-Mk3"].alert_when_damaged = false
	data.raw["unit"]["medium-biter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["medium-biter-Mk3"].alert_when_damaged = false
	data.raw["unit"]["big-biter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["big-biter-Mk3"].alert_when_damaged = false
	data.raw["unit"]["small-spitter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["small-spitter-Mk3"].alert_when_damaged = false
	data.raw["unit"]["medium-spitter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["medium-spitter-Mk3"].alert_when_damaged = false
	data.raw["unit"]["big-spitter-Mk2"].alert_when_damaged = false
	data.raw["unit"]["big-spitter-Mk3"].alert_when_damaged = false



end