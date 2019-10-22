//
//  ViewController.swift
//  swift_polyv_demo
//
//  Created by reanod on 2019/10/22.
//  Copyright © 2019 高效码农. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let plv = PLVDemo()
        plv.polyvInit()
        
        let playController = plv.play()
        let playerPlaceholder = UIView()
        playerPlaceholder.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200)
        self.view.addSubview(playerPlaceholder)
        playController .addPlayer(onPlaceholderView: playerPlaceholder, rootViewController: self)

    }


}

