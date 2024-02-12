setup() {
	load '../../test_helper/bats-support/load'
	load '../../test_helper/bats-file/load'
}

@test "moddesc file exists" {
	assert_file_exists 'LE3/moddesc.ini'
}

@test "mount dlc file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Mount.dlc'
}

@test "coalesced file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM.bin'
}

@test "localization files exist" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_DEU.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_ESN.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_FRA.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_INT.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_ITA.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_JPN.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_POL.tlk'
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/DLC_MOD_PolyROM_RUS.tlk'
}
