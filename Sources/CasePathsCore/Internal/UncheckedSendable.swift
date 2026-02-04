@propertyWrapper
public struct UncheckedSendable<Value>: @unchecked Sendable {
  public var wrappedValue: Value
  public init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  public var projectedValue: Self { self }
}
