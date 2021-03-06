//
//  KVOTests.swift
//  KVOTests
//
//  Created by yangjun on 15/10/10.
//  Copyright © 2015年 六月. All rights reserved.
//

import XCTest

/// KVO测试
class KVOTests: XCTestCase {
    
    /// 用户
    var user:User!;
    
    // MARK: 开始
    override func setUp() {
        super.setUp()
        self.user = User()
        self.user.addObserver(self, forKeyPath: "userName", options: NSKeyValueObservingOptions.New, context: nil)// 监听（KVO的属性必须设置dynamic）
    }
    
    // MARK: 结束
    override func tearDown() {
        super.tearDown()
        self.user.removeObserver(self, forKeyPath: "userName")
        self.user.userName = "YangJun"
    }
    
    // MARK: 测试用例
    func testExample() {
        self.user.userName = "阳君"
    }
    
    // MARK: - 监听
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if "userName" == keyPath {
            print("userName:\((object as? User)?.userName); change:\(change)")
        }
    }
    
}
