![Cover-Swift](https://github.com/user-attachments/assets/40523fdb-c08f-4e34-851a-6a47290b7dee)

##  1. Custom Property Wrappers

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

// use case
@SmartField(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$") var email
```

See more [here](Slides/Topics/PropertyWrapperDemo.swift)
