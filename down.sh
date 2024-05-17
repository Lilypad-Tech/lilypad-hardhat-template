docker-compose down --volumes
kill $(ps aux | grep 'lilypad solver' | awk '{print $2}')
kill $(ps aux | grep 'lilypad mediator' | awk '{print $2}')
kill $(ps aux | grep 'lilypad resource-provider' | awk '{print $2}')