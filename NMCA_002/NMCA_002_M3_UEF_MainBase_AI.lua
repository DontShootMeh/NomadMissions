local BaseManager = import('/lua/ai/opai/basemanager.lua')
local SPAIFileName = '/lua/scenarioplatoonai.lua'

local UEF = 4

local Difficulty = ScenarioInfo.Options.Difficulty

local UEFMainBase = BaseManager.CreateBaseManager()
local UEFNavalB = BaseManager.CreateBaseManager()

function UEFMainBaseAI()
    UEFMainBase:Initialize(ArmyBrains[UEF], 'UEFMainBaseM3', 'M3_UEF_UEFMainBase_Base_Marker', 200, {M3_UEF_Base = 300})
    UEFMainBase:StartNonZeroBase({{16, 20, 24}, {14, 18, 22}})

	UEFMainBase:SetActive('AirScouting', true)
	
	UEFMainBase_AirAttacks()
	UEFMainBase_LandAttacks()
	UEFMainBase_TransportAttacks()
    UEFMainBase_NavalAttacks()
	
end

function UEFMainBase_AirAttacks()
	
	local quantity = {}

	quantity = {5, 10, 15}
	local Temp = {
       'UEFAirM3AttackTemp0',
       'NoPlan',
       { 'uea0203', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Gunships  
    }
    local Builder = {
       BuilderName = 'UEFAirM3AttackBuilder0',
       PlatoonTemplate = Temp,
       InstanceCount = 1,
       Priority = 105,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Airattack3','M3_UEF_Airattack4', 'M3_UEF_Airattack5'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {5, 10, 15}
	Temp = {
       'UEFAirM3AttackTemp1',
       'NoPlan',
       { 'dea0202', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Fighter/bombers 
    }
    Builder = {
       BuilderName = 'UEFAirM3AttackBuilder1',
       PlatoonTemplate = Temp,
       InstanceCount = 1,
       Priority = 104,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Airattack3','M3_UEF_Airattack4', 'M3_UEF_Airattack5'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {5, 6, 7}
	Temp = {
       'UEFAirM3AttackTemp2',
       'NoPlan',
       { 'uea0102', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Fighter
       { 'uea0103', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --bombers 	   
    }
    Builder = {
       BuilderName = 'UEFAirM3AttackBuilder2',
       PlatoonTemplate = Temp,
       InstanceCount = 1,
       Priority = 103,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Airattack3','M3_UEF_Airattack4', 'M3_UEF_Airattack5'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {4, 6, 8}
	Temp = {
       'UEFAirM3AttackTemp3',
       'NoPlan',
       { 'dea0202', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Fighter/bombers	   
    }
    Builder = {
       BuilderName = 'UEFAirM3AttackBuilder3',
       PlatoonTemplate = Temp,
       InstanceCount = 1,
       Priority = 102,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Airattack1','M3_UEF_Airattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {6, 9, 12}
	Temp = {
       'UEFAirM3AttackTemp4',
       'NoPlan',
       { 'uea0203', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Gunship
    }
    Builder = {
       BuilderName = 'UEFAirM3AttackBuilder4',
       PlatoonTemplate = Temp,
       InstanceCount = 1,
       Priority = 100,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Airattack1','M3_UEF_Airattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
end

function UEFMainBase_LandAttacks()
	
	local Temp = {
       'UEFLandM3AttackTemp0',
       'NoPlan',
       { 'uel0303', 1, 5, 'Attack', 'GrowthFormation' }, --Seige Bots
       { 'uel0202', 1, 9, 'Attack', 'GrowthFormation' }, --Heavy tanks  
       { 'uel0205', 1, 4, 'Attack', 'GrowthFormation' }, --Flak  	   
    }
    local Builder = {
       BuilderName = 'UEFLandM3AttackBuilder0',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 105,
       PlatoonType = 'Land',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'MoveToThread'},     
       PlatoonData = {
           MoveChain = 'M3_UEF_Landattack1'
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	local Temp = {
       'UEFLandM3AttackTemp1',
       'NoPlan',
       { 'uel0303', 1, 5, 'Attack', 'GrowthFormation' }, --Seige Bots
       { 'uel0202', 1, 9, 'Attack', 'GrowthFormation' }, --Heavy tanks  
       { 'uel0205', 1, 4, 'Attack', 'GrowthFormation' }, --Flak  	   
    }
    local Builder = {
       BuilderName = 'UEFLandM3AttackBuilder1',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 105,
       PlatoonType = 'Land',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'MoveToThread'},     
       PlatoonData = {
           MoveChain = 'M3_UEF_Landattack2'
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	Temp = {
       'UEFLandM3AttackTemp2',
       'NoPlan',
       { 'uel0307', 1, 2, 'Attack', 'GrowthFormation' }, --Mobile Shield
       { 'uel0202', 1, 12, 'Attack', 'GrowthFormation' }, --Heavy tanks  
       { 'uel0205', 1, 4, 'Attack', 'GrowthFormation' }, --Flak  	   
    }
    Builder = {
       BuilderName = 'UEFLandM3AttackBuilder2',
       PlatoonTemplate = Temp,
       InstanceCount = 5,
       Priority = 100,
       PlatoonType = 'Land',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Landattack1','M3_UEF_Landattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
end

function UEFMainBase_TransportAttacks()
	local opai = nil
    local quantity = {}

    -- Transport Builder
    opai = UEFMainBase:AddOpAI('EngineerAttack', 'M3_MainBase_Transport_Builder1',
    {
        MasterPlatoonFunction = {SPAIFileName, 'LandAssaultWithTransports'},
        PlatoonData = {
            AttackChain = 'M3_UEF_Drop_attack2',
            LandingChain = 'M3_UEF_Drop_Chain2',
            TransportReturn = 'M3_UEF_UEFMainBase_Base_Marker',
        },
        Priority = 1000,
    })
    opai:SetChildQuantity('T2Transports', 3)
    opai:AddBuildCondition('/lua/editor/unitcountbuildconditions.lua',
        'HaveLessThanUnitsWithCategory', {'default_brain', 3, categories.uea0104})

	quantity = {14, 21, 28}
	for i = 1, Difficulty do
		opai = UEFMainBase:AddOpAI('BasicLandAttack', 'M3_UEF_MainBase_Drop_' .. i,
		{
			MasterPlatoonFunction = {SPAIFileName, 'LandAssaultWithTransports'},
			PlatoonData = {
				AttackChain = 'M3_UEF_Drop_attack1',
				LandingChain = 'M3_UEF_Drop_Chain1',
				TransportReturn = 'M3_UEF_UEFMainBase_Base_Marker',
			},
			Priority = 104,
		})
		opai:SetChildQuantity('LightTanks', quantity[Difficulty])
		opai:SetLockingStyle('DeathTimer', {LockTimer = 120})
	end

	quantity = {6, 12, 18}
	for i = 3, Difficulty do
		opai = UEFMainBase:AddOpAI('BasicLandAttack', 'M3_UEF_MainBase_Drop2_' .. i,
		{
			MasterPlatoonFunction = {SPAIFileName, 'LandAssaultWithTransports'},
			PlatoonData = {
				AttackChain = 'M3_UEF_Drop_attack2',
				LandingChain = 'M3_UEF_Drop_Chain2',
				TransportReturn = 'M3_UEF_UEFMainBase_Base_Marker',
			},
			Priority = 106,
		})
		opai:SetChildQuantity('HeavyTanks', quantity[Difficulty])
		opai:SetLockingStyle('DeathTimer', {LockTimer = 180})
	end

	quantity = {14, 14, 24}
	for i = 2, Difficulty do
		opai = UEFMainBase:AddOpAI('BasicLandAttack', 'M3_UEF_MainBase_Drop3_' .. i,
		{
			MasterPlatoonFunction = {SPAIFileName, 'LandAssaultWithTransports'},
			PlatoonData = {
				AttackChain = 'M3_UEF_Drop_attack1',
				LandingChain = 'M3_UEF_Drop_Chain1',
				TransportReturn = 'M3_UEF_UEFMainBase_Base_Marker',
			},
			Priority = 100,
		})
		opai:SetChildQuantity('LightArtillery', quantity[Difficulty])
		opai:SetLockingStyle('DeathTimer', {LockTimer = 160})
	end
end

function UEFMainBase_NavalAttacks()
	
	local Temp = {
       'UEFNavalM3AttackTemp0',
       'NoPlan',
       { 'ues0103', 1, 6, 'Attack', 'GrowthFormation' }, --Frigates
       { 'ues0203', 1, 3, 'Attack', 'GrowthFormation' }, --Subs  	   
    }
    local Builder = {
       BuilderName = 'UEFNavalM3AttackBuilder0',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 104,
       PlatoonType = 'Sea',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Navalattack1','M3_UEF_Navalattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	Temp = {
       'UEFNavalM3AttackTemp1',
       'NoPlan',
       { 'ues0201', 1, 2, 'Attack', 'GrowthFormation' }, --Destroyer
       { 'ues0203', 1, 4, 'Attack', 'GrowthFormation' }, --Subs  	   
    }
    Builder = {
       BuilderName = 'UEFNavalM3AttackBuilder1',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 103,
       PlatoonType = 'Sea',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Navalattack1','M3_UEF_Navalattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	Temp = {
       'UEFNavalM3AttackTemp2',
       'NoPlan',
       { 'ues0202', 1, 2, 'Attack', 'GrowthFormation' }, --Cruisers
       { 'ues0103', 1, 4, 'Attack', 'GrowthFormation' }, --Frigates  	   
    }
    Builder = {
       BuilderName = 'UEFNavalM3AttackBuilder2',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 100,
       PlatoonType = 'Sea',
       RequiresConstruction = true,
       LocationType = 'UEFMainBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_UEF_Navalattack1','M3_UEF_Navalattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
end

function UEFNavalBaseAI()
    UEFNavalB:Initialize(ArmyBrains[UEF], 'UEFNavalBaseM3', 'M3NavalBaseMK', 80, {M3_UEF_NavalBase = 300})
    UEFNavalB:StartNonZeroBase({{6, 8, 10}, {4, 6, 8}})

	UEFNavalB:SetActive('AirScouting', true)
	
	M3UEFNavalBase_AirAttacks()
    M3UEFNavalBase_NavalAttacks()
	
end

function M3UEFNavalBase_AirAttacks()
	
	local quantity = {}
     local opai = nil
	 
	quantity = {4, 6, 8}
	local Temp = {
       'UEFAirNBM3AttackTemp0',
       'NoPlan',
       { 'uea0204', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Gunships  
    }
    local Builder = {
       BuilderName = 'UEFAirNBM3AttackBuilder0',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 105,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_NB_Airattack1','M3_NB_Airattack2', 'M3_NB_Airattack3'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {6, 8, 10}
	Temp = {
       'UEFAirNBM3AttackTemp1',
       'NoPlan',
       { 'uea0102', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Gunships  
    }
    Builder = {
       BuilderName = 'UEFAirNBM3AttackBuilder1',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 100,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_NB_Airattack1','M3_NB_Airattack2', 'M3_NB_Airattack3'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	quantity = {4, 4, 6}
	Temp = {
       'UEFAirNBM3AttackTemp2',
       'NoPlan',
       { 'uea0203', 1, quantity[Difficulty], 'Attack', 'GrowthFormation' }, --Gunships  
    }
    Builder = {
       BuilderName = 'UEFAirNBM3AttackBuilder2',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 100,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_NB_Airattack1','M3_NB_Airattack2', 'M3_NB_Airattack3'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )

      quantity = {6, 8, 10}
    opai = UEFNavalB:AddOpAI('AirAttacks', 'M3_UEFNB_Air_Attack_1',
        {
            MasterPlatoonFunction = {'/lua/ScenarioPlatoonAI.lua', 'CategoryHunterPlatoonAI'},
            PlatoonData = {
              CategoryList = { categories.NAVAL - categories.CYBRAN },
            },
            Priority = 125,
        }
    )
    opai:SetChildQuantity('TorpedoBombers', quantity[Difficulty])
	opai:SetLockingStyle('DeathRatio', {Ratio = 0.5})
	opai:AddBuildCondition('/lua/editor/otherarmyunitcountbuildconditions.lua', 'BrainsCompareNumCategory',
            {'default_brain', {'HumanPlayers'}, 20, categories.NAVAL * categories.MOBILE, '>='})
			
		quantity = {6, 8, 10}
    opai = UEFNavalB:AddOpAI('AirAttacks', 'M3_UEFNB_Air_Attack_2',
        {
            MasterPlatoonFunction = {'/lua/ScenarioPlatoonAI.lua', 'CategoryHunterPlatoonAI'},
            PlatoonData = {
              CategoryList = { categories.NAVAL - categories.CYBRAN },
            },
            Priority = 125,
        }
    )
    opai:SetChildQuantity('TorpedoBombers', quantity[Difficulty])
	opai:SetLockingStyle('DeathRatio', {Ratio = 0.5})
	opai:AddBuildCondition('/lua/editor/otherarmyunitcountbuildconditions.lua', 'BrainsCompareNumCategory',
            {'default_brain', {'HumanPlayers'}, 20, categories.NAVAL * categories.MOBILE, '>='})
			
	Temp = {
       'UEFAirNBM3AttackTemp3',
       'NoPlan',

       { 'uea0102', 1, 8, 'Attack', 'GrowthFormation' }, --Fighters
       { 'uea0204', 1, 6, 'Attack', 'GrowthFormation' }, --TorpedoBombers 	 	   
    }
    Builder = {
       BuilderName = 'UEFAirNBM3AttackBuilder3',
       PlatoonTemplate = Temp,
       InstanceCount = 2,
       Priority = 300,
       PlatoonType = 'Air',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
      PlatoonAIFunction = {SPAIFileName, 'RandomDefensePatrolThread'},     
       PlatoonData = {
           PatrolChain = 'M3_NB_AirPatrol'
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )

end

function M3UEFNavalBase_NavalAttacks()
	
	local Temp = {
       'UEFNavalBM3AttackTemp0',
       'NoPlan',
       { 'xes0102', 1, 2, 'Attack', 'GrowthFormation' }, --Frigates
       { 'ues0203', 1, 4, 'Attack', 'GrowthFormation' }, --Subs  	   
    }
    local Builder = {
       BuilderName = 'UEFNavalBM3AttackBuilder0',
       PlatoonTemplate = Temp,
       InstanceCount = 3,
       Priority = 100,
       PlatoonType = 'Sea',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_NB_Navalattack1','M3_NB_Navalattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
	local Temp = {
       'UEFNavalBM3AttackTemp1',
       'NoPlan',
       { 'ues0202', 1, 2, 'Attack', 'GrowthFormation' }, --Crusiers
       { 'ues0203', 1, 4, 'Attack', 'GrowthFormation' }, --Subs  	   
    }
    local Builder = {
       BuilderName = 'UEFNavalBM3AttackBuilder1',
       PlatoonTemplate = Temp,
       InstanceCount = 3,
       Priority = 100,
       PlatoonType = 'Sea',
       RequiresConstruction = true,
       LocationType = 'UEFNavalBaseM3',
       PlatoonAIFunction = {SPAIFileName, 'PatrolChainPickerThread'},     
       PlatoonData = {
           PatrolChains = {'M3_NB_Navalattack1','M3_NB_Navalattack2'}
       },
    }
    ArmyBrains[UEF]:PBMAddPlatoon( Builder )
	
end

function DisableBase()
    if(UEFMainBase) then
        UEFMainBase:BaseActive(false)
    end
end