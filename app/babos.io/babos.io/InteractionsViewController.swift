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

    func getPlants <Service: Gettable> (fromService service: Service) where Service.Data == Plant  {
        service.get { result in
            switch result {
            case .success(let plants):
                print("success")
                print(plants)
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

