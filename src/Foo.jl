module Foo

using FooBase: FooBase
using PythonCall

const pyfoo = PythonCall.pynew()
function __init__()
    PythonCall.pycopy!(pyfoo, pyimport("pyfoo"))
end

struct Dog <: FooBase.AbstractAnimal end

FooBase.say_hello(dog::Dog) = println("bark!")

function main()
    pyfoo.py_say_hello(Dog())
    FooBase.other_function()
end


end # module
