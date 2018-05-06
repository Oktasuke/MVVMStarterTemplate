//
//  HomeViewController.swift
//  MVVMStarterTemplate
//
//  Created by taisuke.okada on 2018/05/06.
//  Copyright © 2018年 Oktasuke. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    typealias Dependency = AppWireframe
    
    private let disposeBag = RxSwift.DisposeBag()
    private let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    private func subscribe() {
        rx.viewWillAppear
            .take(1)
            .subscribe(onNext: {
                
            }).disposed(by: disposeBag)
        
        rx.viewWillAppear
            .skip(1)
            .subscribe(onNext: {
                
            })
            .disposed(by: disposeBag)
        
        rx.viewDidDisappear
            .subscribe(onNext: {
                
            }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
