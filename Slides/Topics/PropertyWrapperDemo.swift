//
//  PropertyWrapperDemo.swift
//  Slides
//
//  Created by ezen on 04/01/2025.
//

import SwiftUI
import Combine

struct Rules {
	
	static let identifierRegex: String = "[a-zA-Z0-9_]+"
	
	static let emailRegex: String = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
}

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

struct PropertyWrapperDemo: View {
	@SmartField(pattern: Rules.identifierRegex) var name
	
	@SmartField(pattern: Rules.emailRegex) var email
	
    var body: some View {
		VStack(spacing: 20) {
			Input(
				"What's your name ?",
				value: $name,
				isValid: _name.error == nil,
				errorMessage: _name.error ?? ""
			)
			
			Input(
				"Enter your email address ?",
				value: $email,
				isValid: _email.error == nil,
				errorMessage: _email.error ?? ""
			)
			
			Button("Submit Form") {
				// TODO: Check if each field is valid
			}
			.frame(maxWidth: .infinity)
			.buttonStyle(BorderedProminentButtonStyle())
			
			Spacer()
		}
		.padding(20)
	}
	
	func Input(
		_ label: String,
		value: Binding<String>,
		isValid: Bool = true,
		errorMessage: String = ""
	) -> some View {
		VStack(alignment: .leading) {
			Text(label)
			ZStack(alignment: .trailing) {
				TextField("", text: value)
					.padding(.horizontal, 10)
					.frame(height: 42)
					.autocorrectionDisabled()
					.overlay(
						RoundedRectangle(cornerRadius: 6)
							.stroke(Color.primary.opacity(0.3), lineWidth: 1)
					)
				if !isValid {
					Image(systemName: "exclamationmark.circle")
						.foregroundColor(.red)
						.offset(x: -10)
				}
			}
			if !isValid {
				Text(errorMessage)
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(.red)
			}
		}
	}
}

#Preview {
	PropertyWrapperDemo()
}
