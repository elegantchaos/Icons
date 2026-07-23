// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 22/07/2026.
//  Copyright © 2026 Elegant Chaos Limited. All rights reserved.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Icons
import SwiftUI
import Testing

#if canImport(UIKit)
  import UIKit
#endif

/// Tests the public icon model.
struct IconTests {
  /// Verifies that icons preserve their SF Symbol names.
  @Test("Icon preserves its SF Symbol name", arguments: ["star", "square.and.arrow.up"])
  func preservesSystemImageName(_ systemImage: String) {
    let icon = Icon(systemImage)

    #expect(icon.systemImage == systemImage)
  }

  /// Verifies that an icon produces a renderable SwiftUI image.
  @Test func imageRenders() {
    assertRenders(Image(icon: Icon("star")))
  }

  /// Verifies that labels accept localized string resources.
  @Test func labelRendersLocalizedStringResource() {
    let title: LocalizedStringResource = "Star"

    assertRenders(Label(title, icon: Icon("star")))
  }

  /// Verifies that labels accept localized string keys.
  @Test func labelRendersLocalizedStringKey() {
    let title: LocalizedStringKey = "Star"

    assertRenders(Label(title, icon: Icon("star")))
  }

  /// Verifies that labels accept verbatim strings.
  @Test func labelRendersVerbatimString() {
    assertRenders(Label(verbatim: "Star", icon: Icon("star")))
  }

  /// Verifies that labels accept string values as localized resources.
  @Test func labelRendersString() {
    let title = "Star"

    assertRenders(Label(title, icon: Icon("star")))
  }

  /// Verifies that labeled content uses the supplied icon and content.
  @Test func labeledContentRenders() {
    let title: LocalizedStringResource = "Rating"
    let content = LabeledContent(title, icon: Icon("star")) {
      Text("Five")
    }

    assertRenders(content)
  }

  #if canImport(UIKit)
    /// Verifies that an icon produces a UIKit image on supported platforms.
    @Test func uiImageLoads() {
      #expect(UIImage(icon: Icon("star")) != nil)
    }
  #endif

  /// Verifies that SwiftUI content produces a rendered image.
  private func assertRenders<Content: View>(
    _ content: Content,
    sourceLocation: SourceLocation = #_sourceLocation
  ) {
    let renderer = ImageRenderer(content: content)

    #expect(renderer.cgImage != nil, sourceLocation: sourceLocation)
  }
}
