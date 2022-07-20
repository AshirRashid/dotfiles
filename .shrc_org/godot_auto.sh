#!/bin/bash

function gtm_godot_html5 {
    export_base_path=/Users/ashir/workdir/Gantom/Exports
    logfile=$export_base_path/export.log

    ctr=2
    while [ -d $export_base_path/Export$ctr ]; do
        ((ctr++))
    done

    exportPath=$export_base_path/Export$ctr
    projectPath="$gtmDir/Product Selection"

    mkdir "$exportPath"

    (cd "$projectPath" \
        && /Applications/godot.app/Contents/MacOS/Godot --no-window --quiet --path project.godot --export HTML5 "$exportPath/index.html" \
        && echo "Export$ctr $(git log --oneline -1 | cut -d' ' -f1)" >> $logfile \
        && echo "Project at \"$projectPath\" Exported to \"$exportPath\"" \
        && echo -n "$exportPath" | pbcopy && echo "Export directory copied to clipboard"
        )
}


# takes export number as argument and deletes /Users/ashir/workdir/Gantom/Exports/Export{export number} and erases the entry from /Users/ashir/workdir/Gantom/Exports/export.log
function del_gtm_godot_html5 {
    export_base_path=/Users/ashir/workdir/Gantom/Exports
    if [ -d $export_base_path/Export$1 ]; then
        # {delete export dir} && {remove log entry} && {print success message}
        rm -r $export_base_path/Export$1 && gsed -E -i "/^Export$1 [a-z0-9]+$/d" "$export_base_path/export.log" && echo "The specified export has been deleted"
    else
        echo "The specified export does not exist."
    fi
}

