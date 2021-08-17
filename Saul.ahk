#Requires AutoHotkey v2.0-beta.1

Assert(expression, context := '') {
    if (expression) {
        return
    }

    throw Error("Failed assertion", -2, context)
}

AssertEquals(a, b, context := '') {
    try {
        Assert(Type(a) == Type(b))

        t := Type(a)

        switch (t) {
            case 'Integer':
            case 'String':
            case 'Float':
                Assert(a == b)
                
                return
            case 'Map':
                Assert(a.count == b.count)
                for (key, value in a) {
                    Assert(b.Has(key))
                    Assert(b.Get(key) == value)
                }

                return
            case 'Array':
                Assert(a.length == b.length)
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
