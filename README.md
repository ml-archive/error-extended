# ErrorExtended
[![Swift Version](https://img.shields.io/badge/Swift-3.1-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-2-F6CBCA.svg)](http://vapor.codes)
[![Linux Build Status](https://img.shields.io/circleci/project/github/nodes-vapor/error-extended.svg?label=Linux)](https://circleci.com/gh/nodes-vapor/error-extended)
[![macOS Build Status](https://img.shields.io/travis/nodes-vapor/error-extended.svg?label=macOS)](https://travis-ci.org/nodes-vapor/error-extended)
[![codebeat badge](https://codebeat.co/badges/52c2f960-625c-4a63-ae63-52a24d747da1)](https://codebeat.co/projects/github-com-nodes-vapor-error-extended)
[![codecov](https://codecov.io/gh/nodes-vapor/error-extended/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/error-extended)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/error-extended)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/error-extended)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/error-extended/master/LICENSE)

Vapor errors with more granularity.


## 📦 Installation

Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/error-extended.git", majorVersion: 1)
```


## Getting started 🚀

```swift
import ErrorExtended
```

If you need more granular control on the content that goes into your errors conforming to the `AbortError`  protocol you can use the `AbortExtended` type instead (which conforms to `AbortError`). This type will give you access to all of the parameters as well as providing you with some convenient extra parameters.

A couple of examples:

```swift
throw AbortExtended.custom(code: 1337)
```

```swift
throw AbortExtended.custom(
  status: .badRequest, 
  code: 1337, 
  message: "Sorry, bad request", 
  report: false
)
```

```swift
throw AbortExtended.custom(
  status: .badGateway, 
  code: Status.badGateway.statusCode, 
  message: Status.badGateway.reasonPhrase, 
  metadata: Node(["key": "value"]), 
  report: false
)
```

Any middleware (e.g. [bugsnag](https://github.com/nodes-vapor/bugsnag)) that tries to catch errors conforming to `AbortError` will then pick this up.


## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodes.dk).
The package owner for this project is [Mauran](https://github.com/mauran).

## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
