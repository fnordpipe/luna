# luna

lua api builder

## install

    luarocks install luna
    ln -s /your/luna/nginx.conf.compiled /usr/local/openresty/nginx/conf/nginx.conf

the nginx.conf equals the lapis default config except these changes

     worker_processes ${{NUM_WORKERS}};
     error_log stderr notice;
    -daemon off;
     pid logs/nginx.pid;
  
     events {
    @@ -16,9 +15,10 @@ http {
  
     location / {
       default_type text/html;
    -  content_by_lua '
    +  content_by_lua_block {
    +    package.path = package.path .. ';/your/luna/?.lua'
         require('lapis').serve('luna')
    -  ';
    +  }
     }

## example

    % > curl -X GET 127.0.0.1:8080/example/test && echo      
    {"msg":"Hi"}
    % > curl -X POST 127.0.0.1:8080/example/test/hi && echo  
    {"msg":"Hi"}
    % > curl -X DELETE 127.0.0.1:8080/example/test/bye && echo
    {"msg":"Bye"}
