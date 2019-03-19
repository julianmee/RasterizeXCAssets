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
