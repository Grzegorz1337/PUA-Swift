//
//  ViewController.swift
//  Magic Drawing Board
//
//  Created by Kamil Grzeczkowski on 05/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var palette: UIStackView!
    @IBOutlet var colorButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var newImageButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var loadButton: UIBarButtonItem!
    
    @IBOutlet weak var canvas: UIImageView!
    
    @IBAction func colorButtonClicked(_ sender: UIBarButtonItem) {
        self.palette.isHidden = !self.palette.isHidden
    }
    @IBAction func colorPicked(_ sender: UIButton) {
        self.colorButton.image = sender.imageView?.image
        self.colorButton.tintColor = sender.tintColor
        self.palette.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

