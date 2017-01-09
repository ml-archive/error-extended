import PackageDescription

let package = Package(
    name: "error-extended",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1)
    ]
)
