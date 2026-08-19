// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "WorldGeographyArcade",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "WorldGeographyArcade",
            resources: [.process("Resources")]
        )
    ]
)
