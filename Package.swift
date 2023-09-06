// swift-tools-version:5.3
//
// Created by: Egor Boyko

import PackageDescription

let package = Package(
    name: "CollectionViewer",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CollectionViewer",targets: ["CollectionViewer"])
    ],
    targets: [
        .target(
            name: "CollectionViewer",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "CollectionViewerTests",
            dependencies: ["CollectionViewer"]
        ),
    ],
    swiftLanguageVersions: [ .version("5.1") ]
)
