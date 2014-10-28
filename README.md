NOTES

Curl Command To Start App In Marathon
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d@./master/myapp/start_myapp.json 192.168.58.201:8080/v2/apps
