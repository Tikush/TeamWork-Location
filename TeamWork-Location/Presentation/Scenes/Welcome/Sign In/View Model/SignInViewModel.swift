//
//  SignInViewModel.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import Foundation

class UserDefault {
  static var instance: UserDefault = UserDefault()
  private init() {}
  static func udfunc() -> UserDefaults {
    return UserDefaults.standard
  }
  static func getPasswordForThisUser(usernameTextField:String) -> String {
    return udfunc().string(forKey: usernameTextField) ?? ""
  }
  static func createUser(usernameTextField:String, passwordTextField:String) {
    udfunc().set(passwordTextField, forKey: usernameTextField)
  }
}
