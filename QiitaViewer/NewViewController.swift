//
//  NewViewController.swift
//  QiitaViewer
//
//  Created by 木村凌祐 on 2016/07/14.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    @IBOutlet weak var labelText: UILabel!
    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        self.labelText.text = self.label //エラー
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
