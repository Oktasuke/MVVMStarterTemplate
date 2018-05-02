//
//  ArticlesViewModel.swift
//  MVVMStarterTemplate
//
//  Created by taisuke.okada on 2018/05/02.
//  Copyright © 2018年 Oktasuke. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ArticlesViewModel {
    typealias Input = RxCocoa.Signal<Int>
    private let disposeBag = RxSwift.DisposeBag()

    init(input indexSelected: Input, dependency wireframe: AppWireframe) {
    }

}
