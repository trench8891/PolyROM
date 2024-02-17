#!/usr/bin/env bash

current_branch="$(git branch --show-current)"
version="$(cat .version)"
if [[ "main" == "${current_branch}" ]]; then
  if git tag "${version}"; then
    echo "created tag ${version}"
    if git push origin "${version}"; then
      echo "pushed tag ${version}"
    else
      echo "failed pushing tag ${version}"
      exit 1
    fi
  else
    echo "failed to create tag ${version} - maybe it already exists?"
  fi
else
  echo "not on main branch, skip tagging"
fi
