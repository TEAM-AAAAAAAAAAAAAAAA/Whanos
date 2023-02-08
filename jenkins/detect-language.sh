#/bin/bash

available_languages=("C" "java" "javascript" "python" "befunge" "go" NONE)
languages_criteria=("Makefile" "pom.xml" "package.json" "requirements.txt" "main.bf" "main.go" NONE)
script_to_run=("deploy_c.sh" "deploy_java.sh" "deploy_javascript.sh" "deploy_python.sh" "deploy_befunge.sh" "deploy_go.sh" NONE)
index=0

for language in "${languages_criteria[@]}"; do
    if [[ $language == "NONE" ]]; then
        echo "No project found"
        exit 1
    fi
    if [[ -f $language ]]; then
        echo "Found $language"
        echo "Running ${script_to_run[$index]}"
        bash ${script_to_run[$index]}
        exit 0
    fi
    let "index++"
    done
done