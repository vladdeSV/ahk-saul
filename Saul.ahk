#Requires AutoHotkey v2.0-beta.1

Assert(expression, context := '') {
    if (expression) {
        return
    }

    throw Error("Failed assertion", -2, context)
}

AssertEquals(a, b, context := '') {

    /**
     * @param Array haystack
     * @param any needle
     *
     * @return boolean
     */
    InArray(haystack, needle) {
        for (value in haystack) {
            if (value == needle) {
                return true
            }
        }

        return false
    }

    try {
        Assert(Type(a) == Type(b))
        t := Type(a)

        if (InArray(['Integer', 'String', 'Float', 'Object'], t)) {
            Assert(a == b)
                
            return
        }

        if (t == 'Map') {
            Assert(a.count == b.count)
            for (key, value in a) {
                Assert(b.Has(key))
                AssertEquals(b.Get(key), value)
            }

            return
        }

        if (t == 'Array') {
            Assert(a.length == b.length)
            for (index, value in a) {
                AssertEquals(b[index], value)
            }

            return
        }

        throw Error('AssertEquals for type `'' . t . '`' not yet supported')
    } catch Error as e {
        throw Error("Failed assertion", -2, context)
    }
}
