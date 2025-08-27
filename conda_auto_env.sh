# conda auto env
function conda_auto_env(){
        if [ "$PWD" = "$LAST_PWD" ]; then
                return
        fi
        LAST_PWD="$PWD"
        if [ -e ".conda-env" ]; then
                ENV=$(tr -d '[:space:]' < .conda-env)
                if [[ $PATH != *$ENV* ]]; then
                        source activate $ENV
                        if [ $? -eq 0 ]; then
                                echo -e "Using Conda \033[1;36m${ENV}\033[0m Env"
                        else
                                echo -e  "Conda env \033[1;31m'$ENV'\033[0m doesn't exist"
                        fi
                fi
        fi
}
export PROMPT_COMMAND=conda_auto_env
