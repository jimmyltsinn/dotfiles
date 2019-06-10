#/bin/bash

CMD="ln -sfn"

if [[ $1 == "cp" ]]
then
    CMD="cp -r"
fi

# For files in home directory (incl Atom setting)
pushd home > /dev/null
for i in .*; do
    if [ "${i}" == "_ssh" ] || [ "${i}" == "." ] || [ "${i}" == ".." ]
    then
        continue
    fi
    x=`echo ${i}`
    # | sed -E s/_/./`
    rm -rf ${HOME}/${x}
    ${CMD} ${PWD}/${i} ${HOME}/${x}
done
popd > /dev/null

# For .ssh
# pushd home/_ssh > /dev/null
# mkdir -p ~/.ssh
# for i in *; do
#     rm -rf ${HOME}/.ssh/${i}
#     ${CMD} ${PWD}/${i} ${HOME}/.ssh/${i}
# done
# popd > /dev/null

# For sublime text
slpath="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "${slpath}"
rm -rf "${slpath}"
${CMD} ${PWD}/sublime "${slpath}"

# For xcode userdata
xcodepath="${HOME}/Library/Developer/Xcode/UserData"
mkdir -p ${xcodepath}
pushd xcode-userdata > /dev/null
for i in *; do
    rm -rf ${xcodepath}/${i}
    ${CMD} "${PWD}/${i}" "${xcodepath}/${i}"
done
# rm -rf ${xcodepath}
# ${CMD} ${PWD}/xcode-userdata ${xcodepath}
popd > /dev/null
