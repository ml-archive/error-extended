import PackageDescription

let package = Package(
    name: "ErrorExtended",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1)
    ]
)
