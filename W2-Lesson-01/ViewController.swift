//
//  ViewController.swift
//  W2-Lesson-01
//
//  Created by Văn Khánh Vương on 22/03/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testTextField: UITextField!
    var isConfirm = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testTextField.delegate = self
        testTextField.clearButtonMode = .whileEditing
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        let alert = UIAlertController(title: "Cảnh báo !!!", message: "Bạn có muốn xóa toàn bộ text ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.testLabel.text = ""
            self.testTextField.text = ""
            self.isConfirm = true
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {_ in
            self.testTextField.text = self.testLabel.text
            self.isConfirm = false
            let _: UITextPosition = textField.endOfDocument
        }))
        self.present(alert, animated: true, completion: nil)
        return self.isConfirm
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.testLabel.text = self.testTextField.text
    }
}

