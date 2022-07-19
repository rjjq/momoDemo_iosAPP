//
//  ViewController.swift
//  momoDemo
//
//  Created by rjjq on 2022/7/19.
//

import UIKit

class ViewController: UIViewController {

    // 廣告圖片名
    let adImages = ["玩美夏日", "保健_狂降攻略", "美食備中元", "夏拚去", "盛夏GO物節", "酷夏盛典", "線上投保"]
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var pageDot: UIPageControl!
    // 目前頁
    var currIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始 pageDot 數目
        pageDot.numberOfPages = adImages.count
        
        // 初始 segment 內容
        for i in 0...(adImages.count - 1) {
            segment.setTitle("S\(i+1)", forSegmentAt: i)
        }
        updateComponents()
    }
    
    @IBAction func nextPage(_ sender: Any) {
        if currIndex + 1 < adImages.count {
            currIndex = (currIndex + 1) % adImages.count
            updateComponents()
        }
    }
    
    @IBAction func prePage(_ sender: Any) {
        if currIndex > 0 {
            currIndex = (currIndex - 1) % adImages.count
            updateComponents()
        }
    }
    
    @IBAction func segmentChange(_ sender: Any) {
        currIndex = segment.selectedSegmentIndex
        updateComponents()
    }
    
    @IBAction func pageChange(_ sender: Any) {
        currIndex = pageDot.currentPage
        updateComponents()
    }
    
    func updateComponents() {
        adImageView.image = UIImage(named: adImages[currIndex])
        adLabel.text = adImages[currIndex]
        segment.selectedSegmentIndex = currIndex
        pageDot.currentPage = currIndex
    }

}

