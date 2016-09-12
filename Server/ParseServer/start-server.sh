mongodb-runner start
pm2 start server-config.json --env development
node ../../data/insert-data-in-database.js 