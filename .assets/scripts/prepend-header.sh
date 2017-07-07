#!/bin/sh
#------------------------------------------------------------------------------
# SYNOPSIS
#     ${SCRIPT_NAME} [-p, --push] [remote] [message]
#
# DESCRIPTION
#     Prepend a markdown header to API docs and (optionally) commit and push
#     to a Git repository.
#
# OPTIONS
#     -p, --push    Commit and push to a remote repository. You can enter the
#                   name of the remote to which you want to push, or enter
#                   nothing to push to "origin". If a value is provided, it can
#                   be followed by an optional custom commit message.
#
# EXAMPLES
#     # Stage and push to a remote called "github"
#     ${SCRIPT_NAME} -p github
#
#     # Stage and push to "origin"
#     ${SCRIPT_NAME} --push
#
#     # Commit with a custom message and push to "origin"
#     ${SCRIPT_NAME} --push origin "docs(remove): delete deprecated API methods"
#------------------------------------------------------------------------------

# Globals
pushToRemote=0
remoteName="origin"
commitMsg="docs(api): auto-generate api docs and complexity report"

# Variables
baseDir="$(pwd)"
docPath="${baseDir}/docs"
docNames=("README.md" "SWAGGER.md" "COMPLEXITY.md")
tmpDirPath="${baseDir}/.github/.tmp"
menuPath="${baseDir}/.github/assets/jsdoc2md/menu.md"

# Functions
function setCliArgs() {
    # Push to Git (or not)
    argPush="$1"
    pushToRemote=0
    if [ "${argPush}" != "" ]; then
        pushToRemote=1
    fi

    # Get the repository's remote name
    argRemoteName="$2"
    if [ "${argRemoteName}" != "" ]; then
        remoteName="$2"
    fi

    # Set the commit message, if a custom message is entered
    argCustomMsg="${3}"
    if [ "${argCustomMsg}" != "" ]; then
        commitMsg="${argCustomMsg}"
    fi
}

function removeTmpDir() {
  rm -rf ${tmpDirPath}
}

function makeTmpDir() {
  mkdir ${tmpDirPath}
}

function prependHeaderToDoc() {
  tmpDocPath="${tmpDirPath}/${1}"
  cat ${menuPath} > ${tmpDocPath}
  cat "${docPath}/${1}" >> ${tmpDocPath}

}

function createTmpDocs() {
  len=${#docNames[@]}
  idx=0
  while [ ${idx} -lt ${len} ]
  do
    prependHeaderToDoc ${docNames[$idx]}
    idx=$((idx + 1))
  done
}

function copyToDocs() {
  len=${#docNames[@]}
  idx=0
  while [ ${idx} -lt ${len} ]
  do
    cp "${tmpDirPath}/${docNames[$idx]}" "${baseDir}/docs/"
    idx=$((idx + 1))
  done
}

function commitAndPush() {
  remote="${1}"
  msg="${2}"
  branch=$(git rev-parse --abbrev-ref HEAD)
  git add .
  git commit -m "${msg}"
  git push "${remote}" "${branch}"
}

function main() {
  setCliArgs "$1" "$2" "$3"
  removeTmpDir
  makeTmpDir
  createTmpDocs
  copyToDocs
  removeTmpDir
  if [ ${pushToRemote} == 1 ]; then
    commitAndPush ${remoteName} "${commitMsg}"
  fi
}

main "$1" "$2" "$3"
