//
//  LoginController.swift
//  SwiftPortfolio
//
//  Created by Michael Hayes on 4/9/20.
//  Copyright © 2020 Hayes, Michael. All rights reserved.
//

import UIKit
import CoreData

class LoginController: UIViewController {
    let login: [String] = ["username", "password"]
    enum login {
        case username
        case password
    }
    var user = (username: [String()], password: [String()])
    
    @IBOutlet weak var usernameCreate: UITextField!
    
    @IBOutlet weak var debugDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountCredentials(_ sender: Any) {
        signUpSave()
    }
    func signUpSave(){
        saveData(entityName: "User", dataString: usernameCreate.text!)
        
        debugDisplay.text = getData(entityName: "User", user: user.username)
    }
    func saveData(entityName: String, dataString: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // establishes place in core data management
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(dataString, forKey: "username")
        
        do{
            try context.save()
            print("\(entityName) saved successfully")
        } catch{
            print("\(entityName) save failed")
        }
    }
    func getData(entityName: String, user: [String]) -> String {
        var userMut:[String] = user
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // establishes place in core data management
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName) // looks at last piece of data in set
        request.returnsObjectsAsFaults = false // ?
        do{
            let result = try context.fetch(request)
            var count = 0
            for data in result as! [NSManagedObject]{
                userMut[count] = data.value(forKey: entityName) as! String
                count += 1
            }
        } catch{
            print("\(entityName) failed")
        }
        let userReturn: String = userMut.joined()
        return userReturn
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
