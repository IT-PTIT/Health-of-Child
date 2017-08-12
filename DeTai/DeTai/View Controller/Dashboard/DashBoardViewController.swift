//
//  DashBoardViewController.swift
//  DeTai
//
//  Created by Long Nguyen on 7/16/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {

    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var pageHome: UIPageControl!
    @IBOutlet weak var collectionHome: UICollectionView!
    
    var time: Timer!
    var updateCounter: Int!
    var dataHome = [Categories]()
    var header = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = RootTab.dashboardTab.title
        // set up page controller
        updateCounter = 0
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        loadData()
        // set up collection
        setupCollection()
        self.collectionHome.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //RootTab.self
        self.tabBarController?.tabBar.isHidden = false
    }
    
    internal func timerAction() {
        if updateCounter < 5 {
            pageHome.currentPage = updateCounter
            imageHome.image = UIImage(named: String(updateCounter + 1) + ".jpg")
            updateCounter = updateCounter + 1
        } else {
            updateCounter = 0
        }
    }
    
    func setupCollection() {
        collectionHome.delegate = self
        collectionHome.dataSource = self
    }
    
    func loadData() {
        let keys = ["1","2","3","4","5", "6"]
        let names = ["Tìm hiểu cơ thể trẻ", "Chuẩn đoán", "Bệnh và các rối loạn", "Sơ cưu và chăm sóc trẻ", "Lịch sử", "Hướng dẫn sử dụng"]
        let images = [#imageLiteral(resourceName: "Reading"), #imageLiteral(resourceName: "Dig"), #imageLiteral(resourceName: "launch"), #imageLiteral(resourceName: "take-care"), #imageLiteral(resourceName: "star"), #imageLiteral(resourceName: "HDSD")]
        for i in 0 ..< keys.count {
            dataHome.append(Categories(image: images[i], name: names[i], key: keys[i]))
        }
        
    }
    
}

extension DashBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHome.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell
        cell?.data = dataHome[indexPath.item]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/2 - 5, height: collectionView.bounds.width/2 - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = MenuController.newVC(storyBoard: self.storyboard!)
        
        switch indexPath.item {
        case 0:
            header = ["CƠ THỂ HỌC VÀ SỰ PHÁT TRIỂN CỦA TRẺ","SỐNG KHOẺ MẠNH","NHỮNG VẤN ĐỂ Ở EM BÉ"]
            newVC.numberSection = header
            newVC.index = indexPath.item
            newVC.loadChuong()
        case 1:
            header = ["TRẺ EM DƯỚI 1 TUỔI","TRẺ EM TRỂN 1 TUỔI", "TRẺ EM MỌI LỨA TUỔI"]
            newVC.numberSection = header
            newVC.index = indexPath.item
            newVC.loadMenu()
        case 2:
            header = ["BỆNH NHIỄM TRÙNG", "RỐI LOẠN CƠ, XƯƠNG & KHỚP","RỐI LOẠN VỀ DA","RỐI LOẠN VỀ MÁU & HỆ TUẦN HOÀN", "RỐI LOẠN CỦA HỆ HÔ HẤP", "CÁC RỐI LOẠN CỦA HỆ THẦN KINH","RỐI LOẠN VỀ TAI VÀ MẮT", "NHỮNG VẤN ĐỀ VỀ HÀNH VI VÀ CẢM XÚC", "NHỮNG RỐI LOẠN VỀ RĂNG MIỆNG", "NHỮNG RỐI LOẠN Ở HỆ TIÊU HOÁ", "RỐI LOẠN NỘI TIẾT TỐ", "RỐI LOẠN ĐƯỜNG NIỆU VÀ SINH DỤC", "NHỮNG BỆNH LÝ VỀ GIEN"]
            newVC.numberSection = header
            newVC.index = indexPath.item
            newVC.loadChuong()
        default:
            header = []
            newVC.numberSection = header
            newVC.index = indexPath.item
            newVC.loadChuong()
        }
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
