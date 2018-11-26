//
//  ViewController.swift
//  NotesNew
//
//  Created by Smitha Kolan on 11/17/18.
//  Copyright © 2018 Smitha Kolan. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSCore
import AWSDynamoDB


//I9t1w9YwsdoAY3ukQi7YGwD2
//509461372846-jua28o80dogid3idqb6d5qlph5mn43dj.apps.googleusercontent.com

//ios
//509461372846-qd965jgsj3ars9r28d6gcpfj4n92uedk.apps.googleusercontent.com
//google: 509461372846-qd965jgsj3ars9r28d6gcpfj4n92uedk.apps.googleusercontent.com

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func doBtnLogout(_ sender: Any) {
        AWSSignInManager.sharedInstance().logout { (value, error) in
            self.checkForLogin()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkForLogin()
    }
    
    func checkForLogin(){
        if !AWSSignInManager.sharedInstance().isLoggedIn{
            AWSAuthUIViewController.presentViewController(with: self.navigationController!, configuration: nil) { (provider, error) in
                if error == nil {
                    print ("success")
                }else{
                    print (error?.localizedDescription ?? "no value")
                }
            }
        }
    }
    
    func createNote(){
        guard let note = Note() else { return }
        note._userId = AWSIdentityManager.default().identityId
        note._noteId = "123"
        note._content = "Text for my note"
        note._creationDate = Date().timeIntervalSince1970 as NSNumber
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        note._title = "My note on \(df.string(from: <#T##Date#>))"
        saveNote(note: note)
    }
    
    func saveNote(note : Note){
        
    }

}

