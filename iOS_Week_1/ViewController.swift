//
//  ViewController.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToAlgorithmPage(_ sender: Any) {
        
        guard let viewController = storyboard?.instantiateViewController(identifier: "AlgorithmViewController") else {
            fatalError("Opps there is no such viewController")
        }
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func basicsTest(_ sender: Any) {
        // please provide a couple of sample functionality for class, struct and enum use cases by creating your own modules. We provide you some sample class, enum and struct please provide your own.
        // The code below is just sample
        
        //MARK: - Commented out the default calls.

//        let structObj = SampleStruct(title: "title", subTitle: "subTitle")
//        let classObj = SampleClass(name: "name", surName: "surname").setTitleObject(by: structObj)
//        classObj.display()
        
        let skeleton = Skeleton(health: 100, attackStrength: 10)
        let dragon = Dragon(health: 500, attackStrength: 35)
        let bard = Bard()
        skeleton.move()
        dragon.attackStrength = 25
        skeleton.attack()
        dragon.takeDamage(amount: skeleton.attackStrength)
        bard.distract()
        dragon.move()
        dragon.howBig()
        dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane!")
        dragon.attack()
        skeleton.takeDamage(amount: dragon.attackStrength)
        bard.sing()
        dragon.attack()
        skeleton.takeDamage(amount: dragon.attackStrength)
        dragon.attack()
        skeleton.takeDamage(amount: dragon.attackStrength)
        bard.encourage()
        dragon.attack()
        skeleton.takeDamage(amount: dragon.attackStrength)
        
    }

}

