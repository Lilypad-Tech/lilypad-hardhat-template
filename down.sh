docker-compose down --volumes
kill $(ps aux | grep 'lilypad solver' | awk '{print $2}') > /dev/null 2>&1
kill $(ps aux | grep 'lilypad mediator' | awk '{print $2}') > /dev/null 2>&1
kill $(ps aux | grep 'lilypad resource-provider' | awk '{print $2}') > /dev/null 2>&1
kill $(ps aux | grep 'lilypad jobcreator' | awk '{print $2}') > /dev/null 2>&1
kill $(ps aux | grep 'bacalhau' | awk '{print $2}') > /dev/null 2>&1
kill $(ps aux | grep 'geth' | awk '{print $2}') > /dev/null 2>&1
rm .env.addr
touch .env.addr
