//
//  FeedViewController.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import UIKit
import TYCyclePagerView

class FeedViewController: UIViewController {
    @IBOutlet private var pager: TYCyclePagerView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // Private Methods
    private func configurePager(){
        pager.register(UINib(nibName: "PagerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PagerCollectionViewCell")
        pager.dataSource = self
        pager.delegate = self
        pager.isInfiniteLoop = true
    }
}

// MARK:- TYCyclePagerViewDelegate, TYCyclePagerViewDataSource
extension FeedViewController: TYCyclePagerViewDelegate, TYCyclePagerViewDataSource{
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return 5
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PagerCollectionViewCell", for: index)
        return cell
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.layoutType = TYCyclePagerTransformLayoutType(rawValue: 1)!
        // Changing item size depending on whether it has a bottom notch or not
        let bottomArea = UIApplication.shared.windows[0].safeAreaInsets.bottom
        if bottomArea == 0{
            layout.itemSize = CGSize(width: pager.bounds.width-70, height: pager.bounds.height-50)
        }else{
            layout.itemSize = CGSize(width: pager.bounds.width-70, height: pager.bounds.height-85)
        }
        layout.itemSpacing = 17
        return layout
    }
}
