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
