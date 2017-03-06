//
//  TVHomeController.swift
//  TV_Show
//
//  Created by 郑娇鸿 on 17/3/4.
//  Copyright © 2017年 郑娇鸿. All rights reserved.
//

import UIKit

class TVHomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self .setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TVHomeController {
    fileprivate func setupUI() {
        setupNavigationBar()
        
        setupContentView()

    }
    
    fileprivate func setupNavigationBar() {
        let logoImage = UIImage(named: "home-logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: nil, action: nil)
        
        let collectImage = UIImage(named: "search_btn_follow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: collectImage, style: .plain, target: self, action: #selector(collectItemClick))
        
        let searchFrame = CGRect(x: 0, y: 0, width: 200, height: 32)
        let searchBar = UISearchBar(frame: searchFrame)
        searchBar.placeholder = "主播昵称/房间号/链接"
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = .minimal
        
        let searchFiled = searchBar.value(forKey: "_searchField") as? UITextField
        searchFiled?.textColor = UIColor.white
        
//        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    fileprivate func setupContentView() {
        // 1.获取数据
        let homeTypes = loadTypesData()
        
        // 2.创建主题内容
        let style = HYTitleStyle()
        style.isShowCover = true
        style.isScrollEnable = true
        let pageFrame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kScreenH - kNavigationBarH - kStatusBarH - 44)
        /*
         var titles = [String]()
         for type in homeTypes {
         titles.append(type.title)
         }
         */
        
        /*
         let titles = homeTypes.map { (type : HomeType) -> String in
         return type.title
         }
         */
        let titles = homeTypes.map({ $0.title })
        var childVcs = [TVAnchorController]()
        for type in homeTypes {
            let anchorVc = TVAnchorController()
            anchorVc.homeType = type
            childVcs.append(anchorVc)
        }
        let pageView = HYPageView(frame: pageFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
    }
    
    fileprivate func loadTypesData() -> [HomeType] {
        let path = Bundle.main.path(forResource: "types.plist", ofType: nil)!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        var tempArray = [HomeType]()
        for dict in dataArray {
            tempArray.append(HomeType(dict: dict))
        }
        return tempArray
    }


}

// MARK:- 事件处理
extension TVHomeController {
    @objc fileprivate func collectItemClick() {
        print("弹出收藏控制器")
        navigationItem.titleView?.endEditing(true)
    }
}
