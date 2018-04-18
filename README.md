# luna

luna is a wrapper to build api's based on nginx' lua module.
It provides a lean interface to integrate your custom api endpoints.

## install

the setup script requires lxc.

    $ bash ./env.sh <container>

## example

    % > curl -X GET 127.0.0.1:8080/example/test && echo      
    {"msg":"Hi"}
    % > curl -X POST 127.0.0.1:8080/example/test/hi && echo  
    {"msg":"Hi"}
    % > curl -X DELETE 127.0.0.1:8080/example/test/bye && echo
    {"msg":"Bye"}
