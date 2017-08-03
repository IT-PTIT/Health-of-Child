//
//  ReadDataPDF.swift
//  DeTai
//
//  Created by Nhung on 8/2/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import WebKit

class ReadDataPDF: UIViewController {

    class func newVC(storyBoard:UIStoryboard) -> ReadDataPDF {
        let storyBoard : UIStoryboard = UIStoryboard(name: "ReadDataPDF", bundle:nil)
        let newVC = storyBoard.instantiateViewController(withIdentifier: "ReadDataPDF") as! ReadDataPDF
        return newVC
    }
    
    var nameFilePDF:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdfURL = Bundle.main.url(forResource: nameFilePDF, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x:0,y:0,width:view.frame.size.width, height:view.frame.size.height))
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                view.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
            
        }

        // Do any additional setup after loading the view.
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

}
