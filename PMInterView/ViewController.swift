//
//  ViewController.swift
//  PMInterView
//
//  Created by CZ on 1/14/15.
//  Copyright (c) 2015 ProjM. All rights reserved.
//

import UIKit

let title = "TestTitle"
let titleIcon = "Icon.png"
let description = "Test Description ..."
let backgroundImg = "bg.png"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var pageOne = PMInterPage()
        pageOne.title = title!
        pageOne.titleIcon = titleIcon
        pageOne.desc = description
        pageOne.bgImg = backgroundImg
        
        var interView = PMInterView(frame:self.view.bounds)
        interView.addPage(pageOne)
        interView.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

