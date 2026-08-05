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
            .exact("15.12.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Ogury/releases/download/15.12.0/TPOguryAdapter-15.12.0.xcframework.zip",
            checksum: "e97d908433d1f715a300c66facca56e98c19f9b33a52a847bc94669d8544cac9"
        ),
    ]
)
