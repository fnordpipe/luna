# luna

lua api builder

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
