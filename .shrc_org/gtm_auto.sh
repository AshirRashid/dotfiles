#!/bin/bash

gtmDir=/Users/ashir/workdir/Gantom/Repo

alias rungtm="open -n -a Godot --args --verbose --path $gtmDir/Product\ Selection/"
alias copyweeklog="git --git-dir=\"$gtmDir/.git\" log --oneline --since=1.week | sed \"s/[0-9a-f]* /- /\" | pbcopy;"
alias cdgtm="cd $gtmDir"


function gtm {
    cdgtm;
    open -a godot --args -e --path "/Users/ashir/workdir/Gantom/Repo/Product Selection/"
    open -a /Applications/Upwork.app/Contents/MacOS/Upwork;
    open "https://mail.google.com/mail/u/0/#label/Work" "https://app.asana.com/0/1202098350910031/list";
    open -a emacs --args /Users/ashir/workdir/Gantom/Repo/Product\ Selection/
}


function ddebug {
    git --git-dir=/Users/ashir/workdir/Gantom/Deployment/Backend/.git/ \
        --work-tree=/Users/ashir/workdir/Gantom/Deployment/Backend/ \
        checkout 63762c0 /Users/ashir/workdir/Gantom/Deployment/Backend/Backend/settings.py;
    sed -i '' 's/https:\/\/quick-bonfire-350917.uc.r.appspot.com/http:\/\/localhost:8000/' /Users/ashir/workdir/Gantom/Repo/Product\ Selection/API/Request.gd;
}


function dundebug {
    git --git-dir=/Users/ashir/workdir/Gantom/Deployment/Backend/.git/ \
        --work-tree=/Users/ashir/workdir/Gantom/Deployment/Backend/ \
        checkout HEAD /Users/ashir/workdir/Gantom/Deployment/Backend/Backend/settings.py;
    sed -i '' 's/http:\/\/localhost:8000/https:\/\/quick-bonfire-350917.uc.r.appspot.com/' /Users/ashir/workdir/Gantom/Repo/Product\ Selection/API/Request.gd;
}

