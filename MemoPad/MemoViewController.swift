//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 伊藤 遥 on 2018/02/11.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveMemo() {
        saveData.set(titleTextField.text, forKey:"title")
        saveData.set(contentTextView.text, forKey:"content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
