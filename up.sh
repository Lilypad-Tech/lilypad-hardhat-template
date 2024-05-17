echo "🪷 Starting Lilypad services ... 🪷"
docker-compose build
docker-compose up -d ipfs
docker-compose up -d bacalhau
docker-compose up -d geth
sleep 5
./stack fund-admin
./stack fund-services-ether
./stack balances
npm run clean
npm run deploy
./convert-addresses.sh ignition/deployments/chain-1337/deployed_addresses.json
./stack fund-services-tokens
docker-compose up -d solver
docker-compose up -d mediator
docker-compose up -d resource-provider
docker-compose up -d jobcreator
# ./stack solver &
#sleep 5
#./stack mediator &
#sleep 5
#./stack resource-provider
echo "🪷 Lilypad services are up and running. 🪷"