set -e

if [[ -z ${GH_RUNNER_TOKEN} ]];
then
    echo "Environment variable 'GH_RUNNER_TOKEN' is not set"
    exit 1
fi

if [[ -z ${GH_REPOSITORY} ]];
then
    echo "Environment variable 'GH_REPOSITORY' is not set"
    exit 1
fi

if ${first_run};
then
    ./config.sh --unattended --url ${GH_REPOSITORY} --token ${GH_RUNNER_TOKEN}
fi

exec ./run.sh
