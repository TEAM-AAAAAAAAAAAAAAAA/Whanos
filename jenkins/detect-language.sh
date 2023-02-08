#/bin/bash

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
        language_found=(${language_found[@]} $language)
        language_index=$index
    fi
    let "index++"
done

if [[ ${#language_found[@]} > 2 ]]; then
    echo "Multiple projects found"
    exit 1
fi

echo "Found ${available_languages[$language_index]}"
echo "Running ${script_to_run[$language_index]}"
bash ${script_to_run[$language_index]}