echo "🪷 Starting Lilypad services ... 🪷"
docker-compose up -d
sleep 5
./stack fund-admin
./stack fund-services-ether
./stack balances
npm run clean
npm run deploy
./stack fund-services-tokens
./stack solver &
sleep 5
./stack mediator &
sleep 5
./stack resource-provider
echo "🪷 Lilypad services are up and running. 🪷"