// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 30/10/2025.
//  Copyright © 2025 Elegant Chaos Limited. All rights reserved.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import SwiftUI

/// Represents an icon backed by an SF Symbol system image.
nonisolated public struct Icon: Sendable {
  /// The SF Symbols image to use.
  public let systemImage: String

  /// Construct an icon from the given system image name.
  public init(_ value: String) {
    systemImage = value
  }
}

/// Alias to disambiguate usage of `Icon` as a key in situations where
/// it is also used as a generic parameter.
public typealias IconKey = Icon

/// Provides a SwiftUI image initializer backed by an ``Icon``.
extension Image {
  /// Creates an image from an icon's SF Symbol name.
  public init(icon: Icon) {
    self.init(systemName: icon.systemImage)
  }
}

#if canImport(UIKit)
  /// Provides UIKit image initializers backed by an ``Icon``.
  extension UIImage {
    /// Creates an image from an icon's SF Symbol name.
    @available(*, deprecated, message: "Use UIImage(icon:) instead")
    public convenience init?(systemName key: Icon) {
      self.init(systemName: key.systemImage)
    }

    /// Creates an image from an icon's SF Symbol name.
    public convenience init?(icon: Icon) {
      self.init(systemName: icon.systemImage)
    }
  }
#endif

/// Provides label initializers backed by an ``Icon``.
extension Label where Title == Text, Icon == Image {
  /// Creates a label from a localized resource and an icon.
  public init(_ titleKey: LocalizedStringResource, icon: IconKey) {
    self.init(titleKey, systemImage: icon.systemImage)
  }

  /// Creates a label from a localized string key and an icon.
  public init(_ titleKey: LocalizedStringKey, icon: IconKey) {
    self.init(titleKey, systemImage: icon.systemImage)
  }

  /// Creates a label from verbatim text and an icon.
  public init(verbatim title: String, icon: IconKey) {
    self.init(title, systemImage: icon.systemImage)
  }

  /// Creates a localized label from a string literal and an icon.
  public init(_ title: StringLiteralType, icon: IconKey) {
    self.init(LocalizedStringResource(stringLiteral: title), icon: icon)
  }
}

/// Provides labeled-content initializers backed by an ``Icon``.
extension LabeledContent where Label == SwiftUI.Label<Text, Image>, Content: View {
  /// Creates labeled content from a localized resource, an icon, and content.
  public init(
    _ titleKey: LocalizedStringResource, icon: IconKey, @ViewBuilder content: () -> Content
  ) {
    self.init {
      content()
    } label: {
      SwiftUI.Label(titleKey, systemImage: icon.systemImage)
    }
  }
}
