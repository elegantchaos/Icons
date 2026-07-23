# Package guidance and code standards

Generated repository guidance from the shared agent baseline and reviewed the Swift package against the coding, Swift, SwiftUI, concurrency, and testing standards.

The package API remains unchanged. The review added documentation for the icon-backed framework initializers, replaced the placeholder test with coverage of `Icon`'s stored SF Symbol name, and normalized the test file's identity and layout.

A follow-up coverage pass added render-based tests for the SwiftUI image, label, and labeled-content initializers. UIKit image construction is also covered conditionally when the tests run on iOS or tvOS.
