// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusOguryAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusOguryAdapter",
            targets: ["TradPlusOguryAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.16.0")
        ),
        .package(
            url: "https://github.com/Ogury/ogury-sdk-spm.git",
            .exact("5.3.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusOguryAdapter",
            dependencies: [
                .target(name: "TPOguryAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "OgurySdk", package: "ogury-sdk-spm"),
            ],
            path: ".",
            sources: ["Sources/TradPlusOguryAdapter/TradPlusOguryAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPOguryAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Ogury/releases/download/15.16.0/TPOguryAdapter-15.16.0.xcframework.zip",
            checksum: "b59d00b33f9b5efcc2599254dd55808bf9c38b4e8c70dd255cd21bf5d39de622"
        ),
    ]
)
