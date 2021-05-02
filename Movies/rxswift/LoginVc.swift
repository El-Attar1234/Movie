//
//  LoginVc.swift
//  Movies
//
//  Created by Mahmoud Elattar on 4/14/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVc: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    let loginViewModel=LoginViewMode()
    let disposeBag=DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     bindViewToVM()
    }
    
    private func bindViewToVM(){
        bindEmailTextfield()
        bindPasswordTextfield()
        bindButton()
        bindLoading()
        suscribrToResponse()
    }

    private func bindEmailTextfield(){
        emailTF.rx.text.orEmpty.bind(to: loginViewModel.emailBehaviour).disposed(by: disposeBag)
        loginViewModel.emailBehaviour.subscribe(onNext: { [weak self](txt) in
            guard let self=self else{return}
            self.myLabel.text=txt
        }, onCompleted: {
            print("oncompleted")
        }, onDisposed: {
           print("onDisposed")
        }
        ).disposed(by: disposeBag)
    }
    private func bindPasswordTextfield(){
       emailTF.rx.text.orEmpty.bind(to: loginViewModel.emailBehaviour).disposed(by: disposeBag)
    }
    private func suscribrToResponse(){
        loginViewModel.responseObservable.subscribe { [weak self](result) in
            guard let self=self else{return}
            switch result.element {
                            case .success(let response):
                              guard let movies = response?.results else {
                                                   return
                                               }
                          print("movies---->\(movies)")
                               for movie in movies{
                                /*  print("movie name->\(movie.title ?? ""),popularity->\(movie.popularity ?? 8.8),Vote->\(movie.vote_average ?? 8.8)")*/
                              }
                             
                            case .failure(let error):
                                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                                print(error.code)
            case .none:
                print("none")
            }
        }.disposed(by: disposeBag)
    }
    private func bindLoading(){
        loginViewModel.isLoading.subscribe(onNext: { [weak self](isLoading) in
            guard let self=self else{return}
            if isLoading{
            //    self.showIndicator(withTitle: "Loading", and: "")
            }
            else{
              //  self.hideIndicator()
            }
            }).disposed(by: disposeBag)
    }
    private func bindButton(){
        loginBtn.rx.tap
            .throttle(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { (_) in
                self.loginViewModel.getData()
            }).disposed(by: disposeBag)
    }
    
}
