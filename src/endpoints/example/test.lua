local test = {}

function test.sayHi(self)
  return ngx.HTTP_OK, { msg = 'Hi' }
end

function test.sayBye(self)
  return ngx.HTTP_OK, { msg = 'Bye' }
end

test.routes = {
  { context = '', method = 'GET', call = test.sayHi },
  { context = '/hi', method = 'POST', call = test.sayHi },
  { context = '/bye', method = 'DELETE', call = test.sayBye }
}

return test
