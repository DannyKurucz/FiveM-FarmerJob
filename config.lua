cfg = {
    esxLegacy = true,

    blip = {
        ['blipcow'] = vector3(2458.1333, 4756.3159, 34.3039),
        ['blipcowname'] = "Cow Farm",
        ['blipapple'] = vector3(2354.9868, 4744.5879, 34.3690),
        ['blipapplename'] = "Apple Farm",
        ['blippotato'] = vector3(2538.5693, 4810.2466, 33.7287),
        ['blippotatoname'] = "Potato Farm",
        ['sellmilk'] = vector3(1960.9851, 3754.2280, 32.2506),
        ['sellmilkname'] = "Sell Milk",
        ['sellpotato'] = vector3(-1275.8286, -1362.6060, 4.3038),
        ['sellpotatoname'] = "Sell Potato",
        ['sellapple'] = vector3(1674.5890, 4881.3682, 42.0311),
        ['sellapplename'] = "Sell Apple",

    },

    job = {
        ['job'] = "farmer"
    },

    marker = {
        ['apple'] = vector3(2354.9868, 4744.5879, 34.3690),
        ['potato'] = vector3(2530.0308, 4805.2065, 33.6990),
        ['sellmilk'] = vector3(1960.9205, 3754.1567, 32.2515),
        ['sellapple'] = vector3(1674.5890, 4881.3682, 42.0311),
        ['sellpotato'] = vector3(-1275.8286, -1362.6060, 4.3038)

    },

    translation = {
        ['apple'] = "Apple [E]",
        ['potato'] = "Potato [E]",
        ['sellmilk'] = "Sell Milk [E]",
        ['sellapple'] = "Sell Apple [E]",
        ['sellpotato'] = "Sell Potato [E]",
        ['nomilk'] = "You don't have milk",
        ['noapple'] = "You don't have apple",
        ['nopotato'] = "You don't have potato",
        ['limit'] = "You have no place in inventory"
    },

}



Notify = function(msg)
    ESX.ShowNotification(msg)
end
