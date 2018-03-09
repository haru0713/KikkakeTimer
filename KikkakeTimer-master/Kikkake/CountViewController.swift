//
//  CountViewController.swift
//  Kikkake
//
//  Created by 阿部遥人 on 2017/06/30.
//  Copyright © 2017年 阿部遥人. All rights reserved.
//

import UIKit
import UserNotifications

class CountViewController: UIViewController {
    
    var Chunnumber:Int = 0
    var Cnumber:Int = 0
    var timer = Timer()

    
    @IBOutlet var Chunlabel:UILabel!
    
    func up(){
        if Cnumber == 0 && Chunnumber >= 1{
            Chunnumber = Chunnumber - 1
            Cnumber = Cnumber + 60
        }
       
  
        if Cnumber >= 1{
            Cnumber = Cnumber - 1
        }
    
        
        Chunlabel.text = String(format: "%02d",Chunnumber) + ":" + String(format: "%02d",Cnumber)
        
        if Cnumber == 0 && Chunnumber == 0{
            timer.invalidate()
            
          self.dismiss(animated: true, completion: nil)
        }
        
        print(Cnumber)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Chunlabel.text = String(format: "%02d",Chunnumber) + ":" + String(format: "%02d",Cnumber)
 }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timer = Timer.scheduledTimer(timeInterval:1,
                                     target: self,
                                     selector:#selector(self.up),
                                     userInfo: nil,
                                     repeats: true)
                                        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancel(){
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
