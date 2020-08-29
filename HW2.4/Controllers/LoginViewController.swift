//
//  LoginViewController.swift
//  HW2.4
//
//  Created by VICTOR on 28.08.2020.
//  Copyright © 2020 VICTOR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // активация базы данных
    private let user = User.getAuthorizationDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordField.delegate = self
        userNameField.delegate = self
        passwordField.enablesReturnKeyAutomatically = true
        userNameField.enablesReturnKeyAutomatically = true
    }
    
    // скрываем клавиатуру тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // подготоваливаем seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passAccepted" {
            let tabBarController = segue.destination as! UITabBarController
            let userCreditals = tabBarController.viewControllers?.first as! WelcomeViewController
            userCreditals.welcomeText += userNameField.text!
            
      // Хотел передать значение и на другой контроллер, но вылазит ошибка :(
     //       let userInfoVC = tabBarController.navigationController?.viewControllers.first as! ProfileViewController
    //      userInfoVC.userInfo = user.description
        }
    }
    
    // подготовливаем возврат и обнуление полей ввода
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    // определяем переход между полями и функционал кнопки Return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
    // Log In. Проверка имени и пароля
    @IBAction func loginButtonPressed() {
        
        guard let userName = userNameField.text , !userName.isEmpty
            else {
                showAlert(with: "Login is not entered", and: "Please enter login")
                return
        }
        guard let passWord = passwordField.text, !passWord.isEmpty
            else {
                showAlert(with: "Password is not entered", and: "Please enter password")
                return
        }

        // проверка логина и пароля
        if userName == user.name && passWord == user.password {
            performSegue(withIdentifier: "passAccepted", sender: self)
        } else {
            passwordField.text = ""
            showAlert(with: "Invalid login or password", and: "Please enter correct login and password")
        }
    }
    
    @IBAction func forgotNameButton() {
        showAlert(with: "Ooops", and: "Ваш логин: Victor")
    }
    @IBAction func forgotPassButton() {
        showAlert(with: "Ooops", and: "Ваш пароль: 12345")
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
