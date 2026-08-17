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
            .exact("15.13.0")
        ),
        .package(
            url: "https://github.com/Ogury/ogury-sdk-spm.git",
            .exact("5.2.3")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Ogury/releases/download/15.13.0/TPOguryAdapter-15.13.0.xcframework.zip",
            checksum: "50267c224dff2f399884928bd2d98f3f87d0c34078e2c348f982cd68d8477584"
        ),
    ]
)
