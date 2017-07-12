//
//  BaseViewController.swift
//  test
//
//  Created by he on 2017/7/12.
//  Copyright © 2017年 hezongjiang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    fileprivate lazy var label: UILabel = {
       
        let label = UILabel()
        label.text = "随意点一下，进入下一页"
        label.sizeToFit()
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第一个"
        
        view.backgroundColor = UIColor.cyan
        
        label.center = view.center
        view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(FirstViewController(), animated: true)
    }

}
