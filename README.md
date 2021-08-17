🛑 Unsuitable for production until v1.0 is released.

# Saul 🃏
[![ahk version](https://img.shields.io/badge/AHK-2.0--beta.1-428B42)]()

Tests are awesome, but sometimes having a whole testing suite is not suitable.

## Simplistic
Currently, only two function are provided

- `Assert(expression, context := '')`, if `expression` is falsy, an error is thrown with the message `context`.
- `AssertEquals(a, b, context := '')`, if `a` is not strictly equal to `b`*, an error is thrown with the message `context`.

<sub>* If both `a` and `b` are both of type `Array` or `Map`, they are recursively checked by value or key/value respectively. Currently only supports the types `number`, `string`, `Map`, and `Array`.</sub>

## Example

```ahk
; MyScript.test.ahk
#Include "MyScript.ahk"

; simple assertion
Assert(MyNumber() < 42, 'My number must be less than 42')

; compare array by value
AssertEquals(MyArray(), [1, 'test', [1,2,3]], 'My array must be a specific sequence of values')

; compare maps by key/value pairs
AssertEquals(MyMap(), Map('a', 42, 'b', 13.37, 'c', 'foo'), 'My map must always be in a specific way')
```

## License
MIT © [Vladimirs Nordholm](https://github.com/vladdeSV)
