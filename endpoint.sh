#!/bin/bash
set -e

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

# Available env
# echo "INPUT_HOST: ${INPUT_HOST}"
# echo "INPUT_PORT: ${INPUT_PORT}"
# echo "INPUT_USER: ${INPUT_USER}"
# echo "INPUT_PASS: ${INPUT_PASS}"
# echo "INPUT_KEY: ${INPUT_KEY}"
# echo "INPUT_RUN: ${INPUT_RUN}"

CMD="${INPUT_RUN/$'\n'/'expect \'sftp>\''}"

echo "Using password"
expect <<<EOD
spawn "sftp -o Port=$INPUT_PORT $INPUT_USER@$INPUT_HOST"
expect 'password:'
send "$INPUT_PASS\r"
expect "sftp>"
$CMD
expect "sftp>"
send "bye\r"
expect bye\
EOD

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
