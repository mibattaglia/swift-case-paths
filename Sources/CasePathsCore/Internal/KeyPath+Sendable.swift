#if compiler(>=6)
  public typealias _SendableKeyPath<Root, Value> = any Sendable & KeyPath<Root, Value>
#else
  public typealias _SendableKeyPath<Root, Value> = KeyPath<Root, Value>
#endif

// NB: Dynamic member lookup does not currently support sendable key paths and even breaks
//     autocomplete.
//
//     * https://github.com/swiftlang/swift/issues/77035
//     * https://github.com/swiftlang/swift/issues/77105
extension _AppendKeyPath {
  @_transparent
  #if SWIFT_PACKAGE
  package func unsafeSendable<Root, Value>() -> _SendableKeyPath<Root, Value>
  #else
  internal func unsafeSendable<Root, Value>() -> _SendableKeyPath<Root, Value>
  #endif
  where Self == KeyPath<Root, Value> {
    #if compiler(>=6)
      unsafeBitCast(self, to: _SendableKeyPath<Root, Value>.self)
    #else
      self
    #endif
  }
}
