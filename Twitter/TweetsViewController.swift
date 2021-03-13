//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Patrick Elisii on 3/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    @IBOutlet weak var tweetContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetContent.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tweet(_ sender: Any) {
        if (!tweetContent.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetContent.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
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
