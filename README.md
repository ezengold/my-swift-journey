

##  Custom Property Wrappers

**A smart text field that self validate on editing.**

Property wrappers in Swift are a powerful feature that allows you to define reusable logic for managing how properties are stored, validated, or modified. 
They encapsulate behaviors like validation, caching, or thread-safety, enabling code reuse and cleaner property management. In this demo example we build a smart field in SwiftUI that auto validate user input while editing.

```
@propertyWrapper
struct SmartField: DynamicProperty {
	private var pattern: String
	
	@State private var value: String
	
	@State var error: String? = nil
	
	...
}
```

See more [here](Slides/Topics/PropertyWrapperDemo.swift)
