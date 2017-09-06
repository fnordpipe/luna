local test = {}

function test.sayHi(self, params)
  return { status = 200, json = { msg = 'Hi' } }
end

function test.sayBye(self, params)
  return { status = 200, json = { msg = 'Bye' } }
end

test.get = {
  { context = '', call = test.sayHi }
}

test.post = {
  { context = '/hi', call = test.sayHi }
}

test.delete = {
  { context = '/bye', call = test.sayBye }
}

return test
