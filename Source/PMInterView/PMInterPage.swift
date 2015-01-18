//
//  PMInterPage.swift
//  PMInterView
//
//  Created by CZ on 1/14/15.
//  Copyright (c) 2015 ProjM. All rights reserved.
//

import UIKit


@availability(iOS, introduced=7.1)
class PMInterPage : UIView{

    // now has no init
    var title       : String = ""
    var titleIcon   : String = ""
    var desc        : String = ""
    var bgImg       : String = ""
    var bgImgView   : UIImageView?

    override init (frame: CGRect = CGRect.zeroRect) {
        bgImgView = nil
        super.init(frame: frame)
    }
    
    convenience init (frame:CGRect,bgImg:String,title:String = "",titleIcon:String = "",desc:String = "") {
        self.init(frame:frame)
        self.bgImg = bgImg
        self.bgImgView = UIImageView(frame: self.bounds)
        self.bgImgView?.image = UIImage(named: bgImg)
        self.addSubview(self.bgImgView!)
        
        // for test
        self.backgroundColor = UIColor.grayColor()
        println("page size is \(self.frame)")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
