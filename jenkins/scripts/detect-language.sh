#!/bin/bash

available_languages=("C" "java" "javascript" "python" "befunge" "go" NONE)
languages_criteria=("Makefile" "pom.xml" "package.json" "requirements.txt" "main.bf" "main.go" NONE)
script_to_run=("deploy_c.sh" "deploy_java.sh" "deploy_javascript.sh" "deploy_python.sh" "deploy_befunge.sh" "deploy_go.sh" NONE)
index=0
language_found=0
language_index=0

for language in "${languages_criteria[@]}"; do
    if [[ $language == "NONE" ]]; then
        if [[ ${#language_found[@]} == 1 ]]; then
            echo "No project found"
            exit 1
        else
            break
        fi
    fi
    if [[ -f $language ]]; then
        language_found=(${language_found[@]} ${available_languages[$index]})
        language_index=$index
    fi
    let "index++"
done
unset language_found[0]

if [[ ${#language_found[@]} -gt 1 ]]; then
    echo "Multiple projects found (${language_found[@]})"
    exit 1
fi

echo "Found ${available_languages[$language_index]}"
echo "Running ${script_to_run[$language_index]}"
bash -c "/var/lib/jenkins/jobs/scripts/deploy-project.sh nomadic-mesh-376709 $language_index"