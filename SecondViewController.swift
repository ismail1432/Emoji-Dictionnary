//
//  SecondViewController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 31/07/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import AVFoundation
import UIKit

class SecondViewController: UIViewController {

    var emojiSelect = Emoji();
    var emojiDescribe = "Describe";
    
    var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    @IBOutlet weak var emojiToShow: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiToShow.text = emojiSelect.emojiString;
        emojiDescription.text = emojiSelect.description;
        category.text = emojiSelect.translate.uppercased();
        
        let audioFileName = "idrissAbkar-Coran-6"
        let audioFileURL = ""
        if let audioFileURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3", subdirectory: "audio") {
            print(audioFileURL)
        }
        
        let path = Bundle.main.path(forResource: audioFileURL, ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
      
    }
    

}
