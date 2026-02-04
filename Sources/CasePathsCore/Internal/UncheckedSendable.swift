@propertyWrapper
internal struct UncheckedSendable<Value>: @unchecked Sendable {
  internal var wrappedValue: Value
  internal init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  internal var projectedValue: Self { self }
}
