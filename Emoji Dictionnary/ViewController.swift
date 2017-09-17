//
//  ViewController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 31/07/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tav: UITableView!
    //Emoji array dynamically created
    var emojisArray: [Emoji] = []
    {
        didSet {
            tav.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tav.dataSource = self;
        tav.delegate = self;
        
        //backgroundColor
        self.view.backgroundColor = UIColor.green
        //Url request
        let url = "http://localhost:8888/emoji-api/web/app_dev.php/emojis"
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(String(describing: response))") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            }
            // let responseAPI = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(String(describing: responseAPI))") // Affiche dans la console la réponse de l'API
            if error == nil {
                // Ce que vous voulez faire.
                do {
                    
                    // let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    if let parsedData = try JSONSerialization.jsonObject(with: data!) as? [[String:Any]]{
                        for item in parsedData {
                            let emoji1 = Emoji()
                            emoji1.emojiString =  "1F680";
                            emoji1.category =  item["description"] as! String;
                            emoji1.definition = "Un boug qui aime l'oseille !!";
                            self.emojisArray.append(emoji1)
                        }
                    }
                }
                catch {
                    print("Could not serialise")
                }
            }
            
        }
        requestAPI.resume()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojisArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let emoji = emojisArray[indexPath.row];
        cell.textLabel?.text = emoji.emojiString;
        return cell;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let defVC = segue.destination as!
        SecondViewController;
        defVC.emojiSelect = sender as! Emoji
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emojiSelect = emojisArray[indexPath.row];
       // let emojiDescribe = emojisArrayDescription[indexPath.row];
        performSegue(withIdentifier: "secondScreen", sender: emojiSelect)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
           }
    /*
        func makeEmojiArray() -> [Emoji] {
        let emoji1 = Emoji()
        emoji1.emojiString = "🤑";
        emoji1.category = "Visage";
        emoji1.definition = "Un boug qui aime l'oseille !!";
        
        let emoji2 = Emoji()
        emoji2.emojiString = "🐶";
        emoji2.category = "Animal";
        emoji2.definition = "Un chien qui tire la langue !!";
        
        let emoji3 = Emoji()
        emoji3.emojiString = "🤡";
        emoji3.category = "Clown";
        emoji3.definition = "Freddy la terreur";
            
            var arrayTest : [Emoji] = [];
                arrayTest.append(emoji1)
               arrayTest.append(emoji2)
               arrayTest.append(emoji3)
       // return [emoji1,emoji2,emoji3];
          
            return arrayTest
    }
 */

}

