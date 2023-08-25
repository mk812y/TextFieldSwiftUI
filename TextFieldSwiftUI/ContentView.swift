//
//  ContentView.swift
//  TextFieldSwiftUI
//
//  Created by Михаил Куприянов on 22.8.23..
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    var body: some View {
        VStack {
            ForEach(Field.allCases, id: \.hashValue) { field in
                TextField("xxx",
                          text: $userName,
                          prompt: Text(field.placeHolder).foregroundColor(.red.opacity(0.6)))//placeHolder color
                    .submitLabel(.next) //?
                    .padding()
                    .background(Color(UIColor.yellow).cornerRadius(8.8))
                    .shadow(radius: 8.8)
                    .foregroundColor(.green) //text color
                    .autocorrectionDisabled(true)
                    .keyboardType(field.keyBoardType)
            }
            .padding(.horizontal)
            TextField("yyy", text: $userName)
                .textFieldStyle(.roundedBorder)
//                .border(.red)
                .padding()
                .onSubmit {
                    print("yyy")
                }
                .onChange(of: userName) { //onChange in iOS 17
                    print("\(userName)")
                }
        }
    }
}

extension ContentView {
    //TextField Types
    enum Field: Hashable, CaseIterable {
        case name
        case email
        case password
        case mobile
        
        var placeHolder: String {
            switch self {
            case .email: "Enter Email"
            case .name: "Enter Username"
            case .password: "Enter password"
            case .mobile: "Enter mobile number"
            }
        }
        
        var keyBoardType: UIKeyboardType {
            switch self {
            case .email: .emailAddress
            case .name, .password: .default
            case .mobile: .asciiCapableNumberPad
            }
        }
    }
}

#Preview {
    ContentView()
}
