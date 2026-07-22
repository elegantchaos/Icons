// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/07/2026.
//  Copyright © 2026 Elegant Chaos Limited. All rights reserved.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Icons
import Testing

/// Tests the public icon model.
struct IconTests {
  /// Verifies that icons preserve their SF Symbol names.
  @Test("Icon preserves its SF Symbol name", arguments: ["star", "square.and.arrow.up"])
  func preservesSystemImageName(_ systemImage: String) {
    let icon = Icon(systemImage)

    #expect(icon.systemImage == systemImage)
  }
}
