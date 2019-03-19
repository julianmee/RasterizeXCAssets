// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rasterizeassets",
    products: [
        .library(name: "RasterizeAssets", targets: ["RasterizeXCAssets"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander", from: "0.8.0"),
        .package(url: "https://github.com/LinusU/JSBridge", from: "1.0.0-alpha.7"),
    ],
    targets: [
        .target(name: "RasterizeXCAssets", dependencies: ["Commander", "JSBridge"]),
    ]
)


// swift-tools-version:4.0
import PackageDescription

let pkg = Package(name: "RasterizeXCAssets")
pkg.products = [
    .library(name: "RasterizeXCAssets", targets: ["RasterizeXCAssets"]),
]
pkg.dependencies = [
    .package(url: "https://github.com/kylef/Commander", from: "0.8.0"),
    .package(url: "https://github.com/LinusU/JSBridge", from: "1.0.0-alpha.7"),
]

let pmk: Target = .target(name: "RasterizeXCAssets", dependencies: ["Commander", "JSBridge"])
pmk.path = "Sources"


pkg.targets = [
    pmk
]
