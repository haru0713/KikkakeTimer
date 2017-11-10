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
    @IBOutlet var Clabel:UILabel!
    
    func up(){
        if Cnumber == 0 && Chunnumber >= 1{
            Chunnumber = Chunnumber - 1
            Cnumber = Cnumber + 60
        }else{
            
        }
       
        if Cnumber >= 1{
            Cnumber = Cnumber - 1
        }else{
            
            
        }
    
        
        Chunlabel.text = String(Chunnumber)
        Clabel.text = String(Cnumber)
        
        if Cnumber == 0 && Chunnumber == 0{
            timer.invalidate()
            
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "Title") as! ViewController
            self.present(nextView, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   

        Chunlabel.text = String(Chunnumber)
        Clabel.text = String(Cnumber)
        
        let timer = Timer.scheduledTimer(timeInterval:1,
                                         target: self,
                                        selector:#selector(self.up),
                                        userInfo: nil,
                                        repeats: true)
        
                                        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cansell(){
        timer.invalidate()

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
