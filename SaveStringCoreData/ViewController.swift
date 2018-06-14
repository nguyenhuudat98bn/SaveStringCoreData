//
//  ViewController.swift
//  SaveStringCoreData
//
//  Created by nguyễn hữu đạt on 6/14/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var numberText : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
            inputTextField.text = entity.last?.name
        } catch  {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDataToCoreData(_ sender: UIBarButtonItem) {
        let entity = Entity(context: AppDelegate.context)
        entity.name = inputTextField.text
        
        AppDelegate.saveContext()
    }
}

