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
            case 'Map':
                Assert(a.count == b.count)
                for (key, value in a) {
                    Assert(b.Has(key))
                    AssertEquals(b.Get(key), value)
                }

                return
            case 'Array':
                Assert(a.length == b.length)
                for (index, value in a) {
                    AssertEquals(b[index], value)
                }

                return
            default:
                Assert(a == b)
                
                return
        }
    } catch Error as e {
        throw Error("Failed assertion", -2, context)
    }
}
