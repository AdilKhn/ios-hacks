//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Adil Khan on 5/25/16.
//  Copyright © 2016 Adil Khan. All rights reserved.
//

import UIKit

class AboutViewController: ViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html"){
        
            if let htmlData = NSData(contentsOfFile: htmlFile){
            
                let baseUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
