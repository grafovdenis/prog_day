# prog_day
Simple http-server written on Dart and [Aqueduct](https://aqueduct.io/).  
You can run it using gradle on 80 port or using this command on 8888 port:
```
aqueduct serve
```

## Running
    gradle startService

## Examples of working
It has 2 optional params: `year` and `currentDate`.
### `year` as param
    request: GET http://localhost?year=2017
    response: {"errorCode": 200, "dataMessage": "13/09/2017"}
    
    request: GET http://localhost?year=2020
    response: {"errorCode": 200, "dataMessage": "12/09/2020"}
    
    request: GET  http://localhost?year=999
    response: {"errorCode":400,"dataMessage":"Bad request"}

    request: GET http://localhost?yaer=2017
    response: {"errorCode":400,"dataMessage":"Bad request"}
### `currentDate` as param
    request: GET http://localhost:8888/?currentDate=10092017
    response: {"errorCode":200,"dataMessage":"3"}

    request: GET http://localhost:8888/?currentDate=13092017
    response {"errorCode":200,"dataMessage":"365"}

    request: GET http://localhost:8888/?currentDate=10092020
    response: {"errorCode":200,"dataMessage":"2"}

    request: GET http://localhost:8888/?currentDate=12092020
    response {"errorCode":200,"dataMessage":"366"}