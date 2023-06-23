// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftRex",
    platforms: [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v3)],
    products: [
        .library(name: "CombineRex", targets: ["SwiftRex", "CombineRex"]),
        .library(name: "CombineRexDynamic", type: .dynamic, targets: ["SwiftRex", "CombineRex"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftRex",
            exclude: ["CodeGeneration/Templates"]
        ),
        .target(name: "CombineRex", dependencies: ["SwiftRex"]),

        .testTarget(name: "SwiftRexTests", dependencies: ["SwiftRex"]),
        .testTarget(name: "CombineRexTests", dependencies: ["CombineRex"]),

        .testTarget(
            name: "SwiftRexDeprecationTests",
            dependencies: ["SwiftRex"],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        ),
        .testTarget(
            name: "CombineRexDeprecationTests",
            dependencies: ["CombineRex"],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
