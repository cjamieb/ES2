function stormType = ClassifyStorm(windSpeedMph)

rndspd = round(windSpeedMph);

if rndspd >= 39 & windSpeedMph < 74
    stormType = 'Tropical storm'
elseif rndspd <= 38
    stormType = 'Tropical depression'
else
    stormType = 'Hurricane'
end

