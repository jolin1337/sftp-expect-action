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

CMD=${INPUT_RUN//$'\n'/$'\\r"\nexpect "sftp>"\nsend "'}
CMD="send \"$CMD\r\""
echo "Login and Executing $CMD"
expect <<EOD
spawn sftp -o Port=${INPUT_PORT:-22} $INPUT_USER@$INPUT_HOST
expect "(yes/no)?"
send "yes\r"
expect "password:"
send "$INPUT_PASS\r"
expect "sftp>"
$CMD
expect "sftp>"
send "bye\r"
EOD

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
