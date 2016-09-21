//
//  InteractionDetailViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/20/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class InteractionDetailViewController: UIViewController {
    @IBOutlet weak var cardName: CardView!
    @IBOutlet weak var cardScientificName: CardView!
    @IBOutlet weak var cardFamily: CardView!
    @IBOutlet weak var cardParts: CardView!
    @IBOutlet weak var cardPrecautions: CardView!
    @IBOutlet weak var cardInteractions: CardView!
    
    var plant: Plant! {
        didSet {
            print(plant)
            cardName.content = plant.name.description
            cardScientificName.content = plant.scientificName.description
            cardFamily.content = plant.family.description
            cardParts.content = plant.parts.description
            cardPrecautions.content = plant.precautions.description
            cardInteractions.content = plant.interactions.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getPlants(fromService: InteractionsService())
        // Do any additional setup after loading the view.
    }

    func getPlants <Service: Gettable> (fromService service: Service) where Service.Data == Plant  {
        service.get {[weak self] result in
            switch result {
            case .success(let plants):
                self?.plant = plants[0]
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
