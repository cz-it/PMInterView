//
//  ViewController.swift
//  PMInterView
//
//  Created by CZ on 1/14/15.
//  Copyright (c) 2015 ProjM. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var interView = PMInterView(frame:self.view.bounds)
        interView.createPage(bgImg:"bg1@2x")
        interView.createPage(bgImg:"bg2@2x")
        //interView.createPage(bgImg:"bg3@2x")
        //interView.createPage(bgImg:"bg4@2x")
        interView.show(self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

