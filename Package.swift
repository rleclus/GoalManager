// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GoalManager",
	platforms: [
			.iOS(.v18),
			.macOS(.v14)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GoalManager",
            targets: ["GoalManager"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GoalManager",
			swiftSettings: [
				.enableExperimentalFeature("SwiftData")
			]
		),
        .testTarget(
            name: "GoalManagerTests",
            dependencies: ["GoalManager"]
        ),
    ]
)
