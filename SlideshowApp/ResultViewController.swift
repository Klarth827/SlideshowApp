//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by yuji on 2017/12/28.
//  Copyright © 2017年 yuji. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var expansionMonitor: UIImageView!
    
    var expansionImage : UIImage! // 前画面のimageが使えてないのでスコープから外れてる。よって遷移でUIImageのデータを受け渡し。
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expansionMonitor.image = expansionImage

        
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
