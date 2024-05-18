echo "🪷 Starting Lilypad services ... 🪷"
docker-compose build
# docker-compose up -d ipfs
#docker-compose up lilypad
/usr/local/bin/bacalhau serve --node-type compute,requester --peer none --private-internal-ipfs=false --job-selection-accept-networked &
# docker-compose up -d bacalhau
docker-compose up -d geth
sleep 5
./stack fund-admin
./stack fund-services-ether
./stack balances
npm run clean
npm run deploy
./convert-addresses.sh ignition/deployments/chain-1337/deployed_addresses.json
./stack fund-services-tokens
#docker-compose up -d solver
#docker-compose up -d mediator
#docker-compose up -d resource-provider
#docker-compose up -d jobcreator
./stack solver &
sleep 5
./stack mediator &
sleep 2
./stack resource-provider &
sleep 2
./stack jobcreator &
echo "🪷 Lilypad services are up and running. 🪷"
echo "🪷 try a command `./stack run cowsay:v0.0.1 -i Message="moo"` 🪷"