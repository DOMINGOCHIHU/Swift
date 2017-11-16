//
//  ViewController.swift
//  ShowPdfNative
//
//  Created by Desarrollador on 15/11/17.
//  Copyright © 2017 JDCH. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController, QLPreviewControllerDataSource {

    //Requerimientos
    
    /*
        - Es necesario que herede de un navigation para que pueda mostrar el pdf
        - El proceso de definir delegado, datasource se ponga en viwwillappear
        - Los direcciones en previewItemAt sean tipo NSURL
     */
    
    
    //Lista de pdfs si son muchos
    var files  = [NSURL]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get y convert files bundle in NSURL
        let urlString  = Bundle.main.path(forResource: "Expert Android Studio", ofType: "pdf")
        //let urlString  = Bundle.main.path(forResource: "mypdf", ofType: "pdf")
        let nsurl = NSURL(fileURLWithPath: urlString!)
        files.append(nsurl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let controller = QLPreviewController()
        controller.dataSource = self
        present(controller, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        /*let urlString  = Bundle.main.path(forResource: "mypdf", ofType: "pdf")
        let nsurl = NSURL(fileURLWithPath: urlString!)
        return nsurl*/
        
        return files[0]
    }
}

