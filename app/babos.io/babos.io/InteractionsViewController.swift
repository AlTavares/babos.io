//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class InteractionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getPlants(fromService: InteractionsService())
    }

    func getPlants < Service: Gettable where Service.Data == [Plant] > (fromService service: Service) {
        service.get() { [weak self] result in
            switch result {
            case .success(let plants):
                print(plants)
            case .failure(let message):
                print(message)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

