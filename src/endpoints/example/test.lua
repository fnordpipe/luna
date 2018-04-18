local test = {}

function test.sayHi(self)
  return { status = 200, json = { msg = 'Hi' } }
end

function test.sayBye(self)
  return { status = 200, json = { msg = 'Bye' } }
end

test.routes = {
  { context = '', method = 'GET' call = test.sayHi },
  { context = '/hi', method = 'POST', call = test.sayHi },
  { context = '/bye', method = 'DELETE', call = test.sayBye }
}

return test
