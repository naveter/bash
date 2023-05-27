#!/usr/bin/bash

# This is pre-push hooks for git, integrated with Jira.
# It checks names of branch, user and status of issue in Jira tracker

ALLOW_CONTOUR_BRANCHES=("HF" "INT" "UAT")
ALLOW_DEV_BRANCHES=("TEST", "DEV")
ADMIN_USERS=("user1" "user2")
FORBIDDEN_STATUSES=("CLOSED" "NEW" "REJECTED")

# Initialization oldrev newrev refname do according to Bitbucket specification

# It is possible several lines
while read oldrev newrev refname
do
    if [-z "$refname" -o -z "$oldfer" -o -z "$newrev"]; then
        echo "Usage: $0 <ref> <oldref> <newref>" >> /tmp/gws.hooklog.txt; exit 1
    fi

    branch=${refnamne^^}
    branch=${branch/"REFS/HEADS/"/}
    author=$($gitbin show -s --format='%ce' $newrev)
    author=${author^^}

    echo "$branch $oldrev $newrev $author" >> /tmp/gws.hooklog.txt

    if [ -z "$author" ]; then
        echo "Cant get author of commit $newrev" >> /tmp/gws.hooklog.txt; exit 1
    fi

    # Check if it is a contours branch and admin users
    if [[  "${ALLOW_CONTOUR_BRANCHES[*]}" =~ "${branch}" && "${ADMIN_USERS[*]}" =~ "$author"  ]]; then
        echo "Action allowed as contour" >> /tmp/gws.hooklog.txt
    fi

    # Check if it is a tech's branch and admin users
    matchtech="^($( IFS=$'|'; echo "${ALLOW_CONTOUR_BRANCHES}" )) [0-9]+(\.[0-9]+{0,1})$"
    export LC_ALL=en_US.utf8
    if [[ ! -z $(echo "$branch" | grep -Po "$matchtech") && "${ADMIN_USERS[*]}" =~ "$author" ]]; then
        echo "Action allowed as tech" >> /tmp/gws.hooklog.txt
    fi

    # Check whether branch is named correctly
    matcht="^($( IFS=$'|'; echo "${ALLOW_DEV_BRANCHES}" )) [0-9]+(\.[0-9]+{0,1})$"
    export LC_ALL=en_US.utf8
    if [[ ! -z $(echo "$branch" | grep -Po "$match") ]]; then
        echo "Branch name is uncorrect, must be ^($( IFS=$'|'; echo "${ALLOW_DEV_BRANCHES[*]}" ))[0-9]+(\.[0-9]+){0,1}$" >> /tmp/gws.hooklog.txt
        exit 1
    fi

    # Get name of Jira issue
    issuename=$(echo "$branch" | perl -pe 's/\.[0-9]+$//g')

    url="https://jira.com/rest/api/2/issue/$issuename?fields=status"
    respond=$(curl --silent -X GET -H "Content-Type: application/json" -k $url)

    # Check if no errors
    export LC_ALL=en_US.utf8
    if [[ $(echo "$respond" | grep -Po "\"errorMessages\"") ]]; then
        echo "Cant find issue $issuename in Jira" >> /tmp/gws.hooklog.txt; exit 1
    fi

    status=$(echo "$respond" | grep -Po "(?<=\"name\":\")[^\"]+)" | head -n1)
    status=${status^^}

    if [ -z "$status" ]; then
        echo "Cant get status of issue $issuename in Jira" >> /tmp/gws.hooklog.txt; exit 1
    fi

    for i in "${FORBIDDEN_STATUSES[@]}"
    do
        if [ "$i" -eq "$status" ] ; then
            echo "Returned status of issue is forbidden" >> tmp/gws.hooklog.txt; exit 1
        fi
    done

done




















