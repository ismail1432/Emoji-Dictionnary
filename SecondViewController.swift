//
//  SecondViewController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 31/07/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var emojiSelect = Emoji();
    var emojiDescribe = "Describe";
    
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    @IBOutlet weak var emojiToShow: UILabel!
    
     var emojisArrayDescription = ["Super Lunettes", "Chenille-ZER", "1 boug Mickey", "hand in you face", "cAnaRdo !!"]
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiToShow.text = emojiSelect.emojiString;
        emojiDescription.text = emojiSelect.description;
        category.text = emojiSelect.translate.uppercased();
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
      
    }
    

}
