//
//  FirstViewController.swift
//  test
//
//  Created by he on 2017/7/12.
//  Copyright © 2017年 hezongjiang. All rights reserved.
//

import UIKit

private let topViewHeight: CGFloat = 200

class FirstViewController: UIViewController {

    
    fileprivate lazy var tableView: UITableView = {
       
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
        
    }()
    
    fileprivate lazy var topView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pic.png"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: -topViewHeight, width: UIScreen.main.bounds.width, height: topViewHeight)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "导航栏渐变"
        
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.contentInset.top = topViewHeight
        
        view.addSubview(tableView)
        
        tableView.insertSubview(topView, at: 0)
        
        
        navBarTintColor = UIColor.white
        navBarBarTintColor = UIColor.white
        navBarTitleColor = UIColor.white
        
        navBarBackgroundAlpha = 0
        
        statusBarStyle = .lightContent
    }
    
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        vc.title = "\(indexPath.row)"
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        
        setNavAlpha(offset: offset)
        
        setTopView(offset: offset)
    }
    
    private func setNavAlpha(offset: CGFloat) {
        
        let minAlphaOffset: CGFloat = -200
        let maxAlphaOffset: CGFloat = -40
        
        let alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset)
        print("透明度\(alpha)")
        print("偏移量\(offset)")
        print("----------------")
        if alpha > 2 { return }
        
        navBarBackgroundAlpha = alpha
        
        navBarBarTintColor = UIColor(red: 35 / 255.0, green: 110 / 255.0, blue: 140 / 255.0, alpha: alpha)
    }
    
    private func setTopView(offset: CGFloat) {
        
        
        if -offset < topViewHeight {
            return
        }
        topView.frame.size.height = -offset
        topView.frame.origin.y = offset
    }
}
