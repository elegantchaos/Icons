// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "Icons",

  platforms: [
    .macOS("26.0"), .iOS("26.0"), .tvOS("26.0"),
  ],

  products: [
    .library(
      name: "Icons",
      targets: ["Icons"]
    )
  ],

  dependencies: [
    .package(url: "https://github.com/elegantchaos/ActionBuilderPlugin.git", from: "2.1.4")
  ],

  targets: [
    .target(
      name: "Icons"
    ),
    .testTarget(
      name: "IconsTests",
      dependencies: ["Icons"]
    ),
  ]
)

for target in package.targets {
  switch target.type {
  case .regular, .test:
    var settings = target.swiftSettings ?? []
    settings.append(contentsOf: [
      .defaultIsolation(MainActor.self),
      .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
      .enableUpcomingFeature("InferIsolatedConformances"),
      .enableExperimentalFeature("SendableProhibitsMainActorInference"),
    ])
    target.swiftSettings = settings
  default:
    continue
  }

}
