#!/bin/bash

alias drun='python3 manage.py runserver'
alias dshell='python3 manage.py shell'
alias dmakemigrations='python3 manage.py makemigrations'
alias dmigrate='python3 manage.py migrate'
alias dactivate='source /Users/ashir/workdir/Gantom/Deployment/venv/bin/activate'
alias dmanage='python3 manage.py'
alias dcheck='python3 manage.py check --deploy'
alias ddeploygtm='(cd /Users/ashir/workdir/Gantom/Deployment/Backend && python3 manage.py collectstatic && gcloud app deploy)'
alias dtestdeploy='git -C "/Users/ashir/workdir/Gantom/Deployment/Backend" checkout 63762c0 Backend/settings.py && python3 /Users/ashir/workdir/Gantom/Deployment/Backend/manage.py runserver'
alias duntestdeploy='git -C "/Users/ashir/workdir/Gantom/Deployment/Backend" checkout HEAD Backend/settings.py'


function dgen {
    dactivate
    django-admin startproject "$1"
    cd "$1"
    python3 manage.py startapp "$2"
    if [ $3 = code ]
    then
        code .
    fi
}


function dimport {
    if [ $1 = "-h" ]
    then
        printf "\t%s\n" 'Imports static files form a Godot HTML5 export to a Django project' \
            '$1: path to godot html5 export directory' \
            '$2: path to django **project**' \
            '$3: name of django app'
    else
        djangoAppStaticDir="$2/$3/static/$3/"
        djangoAppTemplateDir="$2/$3/templates/$3/"
        # create static and template dirs if they don't already exist
        mkdir -p $djangoAppStaticDir $djangoAppTemplateDir

        # copy all godot export files, except for index.html, into the static dir
        cp -R "$1/" "$djangoAppStaticDir"
        rm "$djangoAppStaticDir/index.html" 

        # create an index.html file in the templates dir
        echo "{% load static %}" > "$djangoAppTemplateDir/index.html"
        # use django's method for importing static files
        gsed -E "s#index.js#{% static \"$3/index.js\" %}#; \
        s#index.icon.png#{% static \"$3/index.icon.png\" %}#; \
        s#index.apple-touch-icon.png#{% static \"$3/index.apple-touch-icon.png\" %}#; \
        s#index.pck#{% static '$3/index.pck' %}#; \
        s#index.wasm#{% static '$3/index.wasm' %}#; \
        s#\"index\"#\"{% static '$3/index' %}\"#; \
        s#<\/body>#<form id=\"csrf_submit\" method=\"post\">{% csrf_token %}<\/form><\/body>#" \
        "$1/index.html" >> "$djangoAppTemplateDir/index.html"
    fi
}


function dimportgtm {
    if [ $1 = "-h" ]
    then
        printf "\t%s\n" 'Imports static files form a Gantom Godot HTML5 export to the gantom Backend Django project' \
            '$1: export number. Used to obtain the export path as /Users/ashir/workdir/Gantom/Exports/Export$1'
    else
        exportDir="/Users/ashir/workdir/Gantom/Exports/Export$1"
        if [ -d $exportDir ]
        then
            dimport $exportDir /Users/ashir/workdir/Gantom/Deployment/Backend/ deploy
        else
            echo 'The specified export cannot be found'
        fi
    fi
}

