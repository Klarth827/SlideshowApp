//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yuji on 2017/12/28.
//  Copyright © 2017年 yuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate {
    
    //画像　配列
    var photos = ["cat.png","dog.png","rensa.png"]
    
    
    //変数
    var photosNum: Int = 0 // photos Array の要素総数
    
    var i: Int = 0 //photos Array の取出し配列番号の変数
    
    var image : UIImage!
    
    var timer: Timer!
    
    var ssSwitch: Bool = false //再生停止のスイッチ
    
    //IBAction
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    @IBAction func back(_ sender: Any) {
        //戻るボタン
        prevPhotos()
        displayImage()
        print("戻る押下")
        print("iの状態：\(i)　photosNumの状態：\(photosNum)")
    }
    
    @IBAction func startAndStop(_ sender: Any) {
        //再生/停止ボタン
        if ssSwitch == false{
            ssSwitch = true
            startTimer()
            
            slideMonitor.isUserInteractionEnabled = false
            backButton.isEnabled = false
            skipButton.isEnabled = false
            ssButton.setTitle("停止", for: .normal)
        } else {
            ssSwitch = false
            resetTimer()
            
            slideMonitor.isUserInteractionEnabled = true
            backButton.isEnabled = true
            skipButton.isEnabled = true
            ssButton.setTitle("再生", for: .normal)
            }
        
        print("再/停　押下 ssSwitch状態:\(ssSwitch)")
    }
    
    @IBAction func Skip(_ sender: Any) {
        //進むボタン
        nextPhotos()
        displayImage()
        print("進む押下")
        print("iの状態：\(i)　photosNumの状態：\(photosNum)")
        
    }
    
    
    
    //IBOutlet
    @IBOutlet weak var slideMonitor: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var ssButton: UIButton!
    
    // func
    func startTimer(){
        //Timer　の中身　２秒ごとにupdateTimer を実行
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            print("タイマースタート")
        }
    }
    
    func updateTimer(timer: Timer) {
        print("タイマー稼動中")
        //selector 実行時　photos Array　の次の数値をセット&表示
        nextPhotos()
        displayImage()
    }
    
    func resetTimer() {
        //Timer の停止　nil set で再処理の準備
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            print("タイマー停止＆再セット完了")
        }
    }
    
    func nextPhotos(){
        //進むの写真を選ぶ際の変数変更関数
        if i == photosNum - 1{
            i = 0
        } else {
            i += 1
        }
    }
    
    func prevPhotos(){
        //戻るの写真を選ぶ際の変数変更関数
        if i == 0 {
            i = photosNum - 1
        } else {
            i -= 1
        }
        
    }
    
    func displayImage(){
        //表示画像の更新用関数
        image = UIImage(named: photos[i])
        slideMonitor.image = image
    }
    
    func imageViewTapped(_ sender: UITapGestureRecognizer){
        print("imageView(slidMonitor)がタップされた")
        segueToResultViewController()
        
    }
    
    func segueToResultViewController(){
        //segueのidentifier を書く必要がある（先生からのメモ）
        self.performSegue(withIdentifier: "toResultViewController", sender: self.image)
    }
    
    
    // view overrride
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //写真枚数確認
        photosNum = photos.count
        print("最大枚数は　\(photosNum)　枚")
        
        //起動後、最初の写真表示
        displayImage()
        print("変数iの中身は　\(i)")
        
        //ImageViewへタップ操作ができるよう設定
        
        slideMonitor.isUserInteractionEnabled = true
        
        slideMonitor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageViewTapped(_:))))
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
    }
    
    //segue さっぱり
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toResultViewController" {
        let expansionData:ResultViewController = segue.destination as! ResultViewController
        
        expansionData.expansionImage = image
    }
    }
    
}

