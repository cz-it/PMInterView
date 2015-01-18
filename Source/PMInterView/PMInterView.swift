//
//  PMInterView.swift
//  PMInterView
//
//  Created by CZ on 1/14/15.
//  Copyright (c) 2015 ProjM. All rights reserved.
//

import UIKit

@availability(iOS, introduced=7.1)
class PMInterView : UIView , UIScrollViewDelegate{

    let TAG = "[PMInterView]:"
    
    
    var curPageIdx  : Int = 0
    var pages : [PMInterPage] = []
    var scrollView  : UIScrollView
    var pageCtrl    : UIPageControl
    var bgView      : UIImageView
    
    override init(frame: CGRect) {
        self.scrollView = UIScrollView(frame:frame)
        self.pageCtrl   = UIPageControl(frame: frame)
        self.bgView     = UIImageView(frame: frame)
        super.init(frame: frame)
        
        self.initScrollView()
    
    }
    
    func initScrollView() {
        self.scrollView.pagingEnabled   = true
        self.scrollView.scrollEnabled   = true
        self.scrollView.bounces         = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.contentSize = self.bounds.size
        
        self.scrollView.delegate = self
    }

    // don't know for what , Xcode fills it automaticlly
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // for default argument and init's argument keyword argument is the default setting
    func createPage(#bgImg:String, title:String = "", titleIcon:String = "", desc:String = "") -> PMInterPage? {
        var x = self.frame.width * CGFloat(self.pages.count)
        var frame = CGRect(x: x, y: 0,width: self.frame.width, height: self.frame.height)
        var page = PMInterPage(frame:frame,bgImg: bgImg, title: title, titleIcon: titleIcon, desc: desc)
        self.pages.append(page)
        return page
    }
    
    func show(view:UIView) {
        self.layoutUI()
        view.addSubview(self)
    }
    
    func layoutUI() {
        println(TAG+"layoutUI")
        self.backgroundColor =  UIColor.blueColor()
        self.layoutBackgroundView()
        self.layoutScrollView()
        self.layoutFooterView()
    }
    
    func layoutBackgroundView() {
        println(TAG + "layoutBackgroundView")
        
        self.bgView.image = UIImage(named: "bg1@2x.png")
        self.addSubview(self.bgView)
    }
    
    func layoutScrollView() {
        println(TAG + "layoutScrollView")
        for page in self.pages {
            println("Add One Page To ScrollView")
            self.scrollView.addSubview(page)
        }
        
        
        self.scrollView.contentSize = CGSize(width: CGFloat(self.pages.count) * self.scrollView.frame.size.width, height:self.scrollView.frame.size.height)
        
        self.pageCtrl.numberOfPages = self.pages.count
        self.pageCtrl.frame = CGRect(x: 0,y: self.frame.height-100,width: self.frame.width,height: 0)
        self.pageCtrl.currentPage = 0;

        self.addSubview(self.scrollView)
        self.addSubview(self.pageCtrl)
    }
    
    func layoutFooterView(){
        println(TAG + "layoutFooterView")
    }
    
    
    /*********** Delegates  for UIScrollView ****************/
    // any offset changes
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("offset position : \(self.scrollView.contentOffset)")
        if (scrollView.contentOffset.x >= (CGFloat((self.pages.count-1))*scrollView.frame.width + scrollView.frame.width*2/5)) {
            self.removeFromSuperview()
        }
        let pageIdx = floor((scrollView.contentOffset.x - scrollView.frame.width / 2) / scrollView.frame.width + 1)
        self.curPageIdx = Int(pageIdx)
        self.pageCtrl.currentPage = self.curPageIdx
        
        println("pageindex is \(pageIdx)")
    }
    
    // any zoom scale changes
    func scrollViewDidZoom(scrollView: UIScrollView) {
    
    }
    
    // called on start of dragging (may require some time and or distance to move)
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    
    }
    
    
    // called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    }
    
    // called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
    }
    
    // called on finger up as we are moving
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
    
    }
    
    // called when scroll view grinds to a halt
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    
    }
    
    // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    
    }
    
    // return a view that will be scaled. if delegate returns nil, nothing happens
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
    }
    
    // called before the scroll view begins zooming its content
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
    
    }
    
    // scale between minimum and maximum. called after any 'bounce' animations
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
    
    }
    
    // return a yes if you want to scroll to the top. if not defined, assumes YES
    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        return false
    }
    
    // called when scrolling animation finished. may be called immediately if already at top
    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
    
    }

}