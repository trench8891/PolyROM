setup() {
	load '../../test_helper/bats-support/load'
	load '../../test_helper/bats-file/load'
	load '../../test_helper/bats-assert/load'
}

@test "unpacked BioAI file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioAI.xml'
}

@test "unpacked BioCredits file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioCredits.xml'
}

@test "unpacked BioDifficulty file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioDifficulty.xml'
}

@test "unpacked BioEngine file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioEngine.xml'
}

@test "unpacked BioGame file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioGame.xml'
}

@test "unpacked BioInput file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioInput.xml'
}

@test "unpacked BioUI file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioUI.xml'
}

@test "unpacked BioWeapon file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/BioWeapon.xml'
}

@test "unpacked Mod file exists" {
	assert_file_exists 'LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/Default_DLC_MOD_PolyROM.xml'
}

@test "coalesced and unpacked coalesed diffs aligned" {
	diff_files="$(git diff --name-only main)"
	unpacked_changed=false
	coalesced_changed=false

	if [[ "${diff_files}" == *"LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM/"* ]]; then
		unpacked_changed=true
	fi

	if [[ "${diff_files}" == *"LE3/DLC_MOD_PolyROM/CookedPCConsole/Default_DLC_MOD_PolyROM.bin"* ]]; then
		coalesced_changed=true
	fi

	assert_equal "${unpacked_changed}" "${coalesced_changed}"
}
