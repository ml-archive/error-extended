# error-extended
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Build Status](https://travis-ci.org/nodes-vapor/error-extended.svg?branch=master)](https://travis-ci.org/nodes-vapor/error-extended)
[![codecov](https://codecov.io/gh/nodes-vapor/sanitized/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/error-extended)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/error-extended/master/LICENSE)

Errors with more granularity.

## Integration
Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/error-extended.git", majorVersion: 0)
```

## Getting started 🚀
If you need more granular control on the content that goes into your errors conforming to the `AbortError`  protocol you can use the `AbortExtended` type instead (which conforms to `AbortError`). This type will give you access to all of the parameters as well as providing you with some convenient extra parameters.

A couple of examples:

```swift
throw AbortExtended.custom(code: 1337)
```

```swift
throw AbortExtended.custom(status: .badRequest, code: 1337, message: "Sorry, bad request", report: false)
```

```swift
throw AbortExtended.custom(status: .badGateway, code: Status.badGateway.statusCode, message: Status.badGateway.reasonPhrase, metadata: Node(["key": "value"]), report: false)
```

Any middleware (e.g. [bugsnag](https://github.com/nodes-vapor/bugsnag)) that tries to catch errors conforming to `AbortError` will then pick this up.

## 🏆 Credits
This package is developed and maintained by the Vapor team at [Nodes](https://www.nodes.dk).

## 📄 License
This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)