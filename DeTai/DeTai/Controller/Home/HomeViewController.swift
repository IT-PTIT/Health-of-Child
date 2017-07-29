//
//  HomeViewController.swift
//  DeTai
//
//  Created by FunTap on 6/12/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgGioiThieu: UIImageView!
    @IBOutlet weak var pgGioiThieu: UIPageControl!
    @IBOutlet weak var btChuong1: UIButton!
    @IBOutlet weak var btChuong2: UIButton!
    @IBOutlet weak var btChuong3: UIButton!
    @IBOutlet weak var btChuong4: UIButton!
    
    var time : Timer!
    var updateCounter : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "HOME"
        updateCounter = 0;
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    internal func timerAction() {
        if updateCounter < 5 {
            pgGioiThieu.currentPage = updateCounter
            imgGioiThieu.image = UIImage(named: String(updateCounter + 1) + ".jpg")
            updateCounter = updateCounter + 1
        } else {
            updateCounter = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Chuong1Action(_ sender: Any) {
        let thongtinView = self.storyboard?.instantiateViewController(withIdentifier: "IDInfoStep1ViewController") as? InfoStep1ViewController
        self.navigationController?.pushViewController(thongtinView!, animated: true)
    }

    @IBAction func Chuong2Action(_ sender: Any) {
    }
    
    @IBAction func Chuong3Action(_ sender: Any) {
    }
    
    @IBAction func Chuong4Action(_ sender: Any) {
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
