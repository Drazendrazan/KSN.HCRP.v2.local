QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 10
            },
        },
	},
	['police'] = {
		label = 'Law Enforcement',
    type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Academy Cadet',
                payment = 25
            },
						['1'] = {
                name = 'Probational Officer',
                payment = 45
            },
						['2'] = {
                name = 'Full-time Officer',
                payment = 100
            },
						['3'] = {
                name = 'Cpl',
                payment = 150
            },
						['4'] = {
                name = 'Sgt',
                payment = 185
            },
						['5'] = {
                name = 'Lt',
                payment = 275
            },
						['6'] = {
                name = 'Captain',
								isboss = true,
                payment = 400
            },
						['7'] = {
                name = 'Deputy Chief',
								isboss = true,
                payment = 650
            },
						['8'] = {
                name = 'Chief',
								isboss = true,
                payment = 1000
            },
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
						['1'] = {
                name = 'Paramedic',
                payment = 75
            },
						['2'] = {
                name = 'Doctor',
                payment = 100
            },
						['3'] = {
                name = 'Surgeon',
                payment = 125
            },
						['4'] = {
                name = 'Chief',
								isboss = true,
                payment = 150
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
						['1'] = {
                name = 'House Sales',
                payment = 75
            },
						['2'] = {
                name = 'Business Sales',
                payment = 100
            },
						['3'] = {
                name = 'Broker',
                payment = 125
            },
						['4'] = {
                name = 'Manager',
								isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
						['1'] = {
                name = 'Driver',
                payment = 75
            },
						['2'] = {
                name = 'Event Driver',
                payment = 100
            },
						['3'] = {
                name = 'Sales',
                payment = 125
            },
						['4'] = {
                name = 'Manager',
								isboss = true,
                payment = 150
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
						['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
						['2'] = {
                name = 'Business Sales',
                payment = 100
            },
						['3'] = {
                name = 'Finance',
                payment = 125
            },
						['4'] = {
                name = 'Manager',
								isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
						['1'] = {
                name = 'Novice',
                payment = 75
            },
						['2'] = {
                name = 'Experienced',
                payment = 100
            },
						['3'] = {
                name = 'Advanced',
                payment = 125
            },
						['4'] = {
                name = 'Manager',
								isboss = true,
                payment = 150
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
	-- FedRP Addons
	['fat'] = {
		label = 'Firearm, Alcohol & Tobacco',
    type = "oga",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Probationary Agent',
                payment = 50
            },
						['1'] = {
                name = 'Agent',
                payment = 75
            },
						['2'] = {
                name = 'Sr. Agent',
                payment = 100
            },
						['3'] = {
                name = 'Managing Director',
                payment = 125
            },
						['4'] = {
                name = 'Director of FAT',
								isboss = true,
                payment = 150
            },
        },
	},

}
