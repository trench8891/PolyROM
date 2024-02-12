setup() {
	load '../test_helper/bats-support/load'
	load '../test_helper/bats-file/load'
	load '../test_helper/bats-assert/load'

	release_version="$(cat .version)"
	le3mod_version="$(cat LE3/moddesc.ini | grep modver | awk '{print $3}')"
}

@test "version file exists" {
	assert_file_exists '.version'
}

@test "le3 mod version is correct" {
	assert_equal "${le3mod_version}" "${release_version}"
}
