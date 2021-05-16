// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Stinsen",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v7)],
    products: [
        .library(
            name: "Stinsen",
            type: .dynamic,
            targets: ["Stinsen"]
        ),
        .library(
            name: "Stinsen (Static)",
            targets: ["Stinsen"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
    ],
    targets: [
        .target(
            name: "Stinsen",
            dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.1"),
    ]),
    ]
)
