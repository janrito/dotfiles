# remove path duplicates
# http://www.commandlinefu.com/commands/view/8606/speed-up-builds-and-scripts-remove-duplicate-entries-in-path.-users-scripts-are-oftern-bad-pathapathpath-type-of-thing-cause-diplicate.

# join arguments
function glu() {
    local IFS="$1"
    shift && echo "$*"
}

# remove duplicates
function repath() {
    _E=`echo "${@//:/$'\n'}" | awk '!x[$0]++'`
    glu ":" $_E
}

export PATH=$(repath $PATH)