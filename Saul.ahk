#Requires AutoHotkey v2.0-beta.1

AssertEquals(a, b, context := '') {
    try {
        __Assert(Type(a) == Type(b))

        t := Type(a)

        switch (t) {
            case 'Integer':
            case 'String':
            case 'Float':
                __Assert(a == b)
                
                return
            case 'Map':
                __Assert(a.count == b.count)
                for (key, value in a) {
                    __Assert(b.Has(key))
                    __Assert(b.Get(key) == value)
                }

                return
            case 'Array':
                __Assert(a.length == b.length)
                for (index, value in a) {
                    AssertEquals(b[index], value)
                }

                return
            default:
                throw Error('AssertEquals for type `'' . t . '`' not yet supported')
        }
    } catch Error as e {
        throw Error("Failed assertion", -2, context)
    }
}

__Assert(expression, context := '') {
    if (expression) {
        return
    }

    throw Error("Failed assertion", -2, context)
}
