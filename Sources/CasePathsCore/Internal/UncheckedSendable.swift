@propertyWrapper
#if SWIFT_PACKAGE
package struct UncheckedSendable<Value>: @unchecked Sendable {
  package var wrappedValue: Value
  package init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  package var projectedValue: Self { self }
}
#else
internal struct UncheckedSendable<Value>: @unchecked Sendable {
  internal var wrappedValue: Value
  internal init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  internal var projectedValue: Self { self }
}
#endif
