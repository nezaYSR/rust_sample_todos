ab -n 100000 -k -c 30 -q http://localhost:8080/todos
ab -p todo.json -T application/json -n 100000 -k -c 30 -q http://localhost:8080/todos

docker-compose --compatibility up -d --build
