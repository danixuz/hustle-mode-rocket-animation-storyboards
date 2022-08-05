//
//  ViewController.swift
//  hustle-mode
//
//  Created by Daniel Spalek on 05/08/2022.
//

import UIKit
import AVFoundation // to play audio , we need a framework that allows us to

class ViewController: UIViewController {
    
    // We are connecting user interface elements to our code so we can do things with them.
//    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer! // "!" - implicitly unwrapped optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this is a function that is the starting point of your code when the screen first load. here we can initialize things.
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithFileSystemRepresentation: path, isDirectory: false, relativeTo: .applicationDirectory)// IOS works with URLs for it's local file system
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
//        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3) {
            self.rocket.frame = CGRect(x: 0, y: 80, width: 390, height: 651)
        } completion: { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }

    }
    
}

