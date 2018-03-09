//
//  ViewController.swift
//  Kikkake
//
//  Created by 阿部遥人 on 2017/06/16.
//  Copyright © 2017年 阿部遥人. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var number:Int = 0
    var hunnumber:Int = 0
    var toriga:Int = 0
    let Sbutton = UIButton()

    
    @IBOutlet var picker: UIPickerView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toCount") {
            let countView : CountViewController = segue.destination as! CountViewController
            countView.Chunnumber = self.hunnumber
            countView.Cnumber = self.number
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // プロトコルの設定
        picker.delegate = self
        picker.dataSource = self
        
        // はじめに表示する項目を指定
        picker.selectRow(1, inComponent: 0, animated: true)
        
        Sbutton.layer.cornerRadius = 10
        
        
        
    }
    
    // UIPickerViewDataSource
    override func viewWillAppear(_ animated: Bool) {
        toriga = 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 4
    }
    
    //アイテムの個数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 {
            return 31
            
        }else if component == 2{
            return 61
        }else {
            return 0
        }}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        if component  == 1{
            hunnumber = row
        }else{
            number = row
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //ラベルを宣言
        var pickerlabel:UILabel = UILabel()
        
        pickerlabel.text = String(row)
        
        pickerlabel.font = UIFont.systemFont(ofSize: 27)
        
        return pickerlabel
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func set(){
        
        
        for _ in 0...50{
            
            let trigger: UNNotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval:(TimeInterval(hunnumber*60+number+toriga)), repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = ""
            content.body = "さあ、作業を始めよう！"
            content.sound = UNNotificationSound.default()
            
            let request = UNNotificationRequest(identifier: "normal"+String(toriga),
                                                content: content,
                                                trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            toriga = toriga + 1
            
            print(number)
            print(hunnumber)
            print(toriga)
            
        }
        
        self.performSegue(withIdentifier: "toCount", sender: nil)
        
        
    }
    
    
}
