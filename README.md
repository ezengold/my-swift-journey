##  Custom Property Wrappers

A smart text field that self validate on editing

```
@propertyWrapper
struct SmartField: DynamicProperty {
	private var pattern: String
	
	@State private var value: String
	
	@State var error: String? = nil
	
	var wrappedValue: String {
		get { value }
		nonmutating set {
			self.value = newValue
			self.validate()
		}
	}
	
	var projectedValue: Binding<String> {
		Binding {
			wrappedValue
		} set: {
			wrappedValue = $0
		}
	}
	
	init (defaultValue: String = "", pattern: String) {
		self.pattern = pattern
		_value = State(wrappedValue: defaultValue)
		self.validate()
	}
	
	func validate() {
		if let _ = self.value.range(
			of: pattern,
			options: .regularExpression
		) {
			withAnimation {
				self.error = nil
			}
		} else {
			withAnimation {
				self.error = "Invalid value 😀"
			}
		}
	}
}
```
