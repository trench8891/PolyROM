#!/usr/bin/env bash

current_branch="$(git branch --show-current)"
base_branch="${BASE_BRANCH:-main}"
if [[ "main" != "${currnet_branch}" ]]; then
	cur_major="$(cat .version | sed 's/\.[0-9]\{1,255\}\.[0-9]\{1,255\}//')"
	cur_minor="$(cat .version | sed 's/[0-9]\{1,255\}\.//' | sed 's/\.[0-9]\{1,255\}//')"
	cur_patch="$(cat .version | sed 's/[0-9]\{1,255\}\.[0-9]\{1,255\}\.//')"

	git checkout "${base_branch}" -- .version

	base_major="$(cat .version | sed 's/\.[0-9]\{1,255\}\.[0-9]\{1,255\}//')"
	base_minor="$(cat .version | sed 's/[0-9]\{1,255\}\.//' | sed 's/\.[0-9]\{1,255\}//')"
	base_patch="$(cat .version | sed 's/[0-9]\{1,255\}\.[0-9]\{1,255\}\.//')"

	echo "${base_major}.${base_minor}.${base_patch} -> ${cur_major}.${cur_minor}.${cur_patch}"

	git checkout .version

	if [[ ${cur_major} -eq ${base_major} ]]; then
		# major versions match
		if [[ ${cur_minor} -eq ${base_minor} ]]; then
			# minor versions match
			if [[ ${cur_patch} -ne $((base_patch+1)) ]]; then
				# versions are identical
				echo "versions are identical!"
				exit 1
			fi
		elif [[ ${cur_minor} -eq $((base_minor+1)) ]]; then
			# minor version is incremented
			if [[ ${cur_patch} -ne 0 ]]; then
				# patch version is not correct
				echo "patch version is not correct!"
				exit 1
			fi
		else
			#minor version is not correct
			echo "minor version is not correct!"
			exit 1
		fi
	elif [[ ${cur_major} -eq $((base_major+1)) ]]; then
		# major version is incremented
		if [[ ${cur_minor} -ne 0 ]]; then
			# minor version is not correct
			echo "minor version is not correct!"
			exit 1
		elif [[ ${cur_patch} -ne 0 ]]; then
			# patch version is not correct
			echo "patch version is not correct!"
			exit 1
		fi
	else
		# major version is not correct
		echo "major version is not correct!"
		exit 1
	fi
	echo "version seems valid"
else
	echo "on main, skip version check"
fi
