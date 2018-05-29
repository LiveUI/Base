//
//  OnboardingViewController.swift
//  LiveUIBase
//
//  Created by Ondrej Rafaj on 28/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit


/// Basic onboarding view controller
open class OnboardingViewController: ViewController, UIScrollViewDelegate {
    
    /// Did change screen index
    public var changedScreenIndex: ((Int) -> ())?
    
    /// Skip all
    let skipAll: Button.Tuple?
    
    /// Screen configurations
    let configurations: [OnboardingView.Config]
    
    /// Main scroll view
    public let scrollView = ScrollView()
    
    /// Page indicator
    public let pageIndicator = UIPageControl()
    
    // MARK: Initialization
    
    /// Initializer
    public init(_ configurations: [OnboardingView.Config], style: Style = .dark, skipAll: Button.Tuple? = nil) {
        self.skipAll = skipAll
        self.configurations = configurations
        
        super.init(nibName: nil, bundle: nil)
        
        pageIndicator.style(with: style)
    }
    
    /// Not implemented
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Elements
    
    func setupScrollView() {
        scrollView.place.on(andFill: view)
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        var x = 0
        var last: UIView?
        for config in configurations {
            let view = OnboardingView(config)
            
            let make: Make<OnboardingView>
            if let last = last {
                make = view.place.next(to: last, left: 0)
            } else {
                make = view.place.on(scrollView).left(0)
            }
            make.match(top: scrollView).match(height: scrollView).match(width: scrollView)
            
            last = view
            x += 1
            
            if x == configurations.count {
                make.right(0)
            }
        }
    }
    
    func setupSkipAll() {
        if let skipAllButton = skipAll.button() {
            skipAllButton.sizeToFit()
            skipAllButton.place.on(view, top: 30).right(-20).height(36)
        }
    }
    
    func setupPageIndicator() {
        pageIndicator.numberOfPages = configurations.count
        pageIndicator.currentPage = 0
        pageIndicator.addTarget(self, action: #selector(pageIndicatorDidChange(_:)), for: .valueChanged)
        
        pageIndicator.sizeToFit()
        
        let w = (pageIndicator.frame.size.height + 12)
        let h = (pageIndicator.frame.size.height - 6)
        
        pageIndicator.layer.cornerRadius = (h / 2)
        
        view.addSubview(pageIndicator)
        pageIndicator.snp.makeConstraints { (make) in
            make.width.equalTo(w)
            make.height.equalTo(h)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override open func setupElements() {
        super.setupElements()
        
        setupScrollView()
        setupSkipAll()
        setupPageIndicator()
    }
    
    // MARK: Actions
    
    @objc func pageIndicatorDidChange(_ sender: UIPageControl) {
        scrollView.goto(page: sender.currentPage)
    }
    
    // MARK: Scroll view delegate methods
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        var page = round(((scrollView.contentOffset.x + width) / width) - 1)
        if page.isNaN {
            page = 0
        }
        
        let pInt = Int(page)
        if pInt != pageIndicator.currentPage {
            pageIndicator.currentPage = pInt
            changedScreenIndex?(pInt)
        }
    }
    
}
