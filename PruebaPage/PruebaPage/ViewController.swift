//
//  ViewController.swift
//  PruebaPage
//
//  Created by Ingeniero de Software on 9/26/17.
//  Copyright © 2017 Plenumsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var page : UIPageViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        crearPageController()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func crearPageController(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        page = storyboard.instantiateViewController(withIdentifier: "pageViewController") as! UIPageViewController
        
        page?.dataSource = self
        page?.delegate = self
        
        let viewController = self.crearViewControllerEmbed(posicion: 0)
        let viewControllers = [viewController]
        page?.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        
        page?.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
        
        addChildViewController(page!)
        self.view.addSubview(page!.view)
        page?.didMove(toParentViewController: self)
        
    }
    
    func crearViewControllerEmbed(posicion:Int) -> EmbedViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "viewControllerEmbed") as! EmbedViewController
        view.posicion = posicion
        return view
        //return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! EmbedViewController
        let posicion = viewController.posicion
        if posicion > 0 {
            return crearViewControllerEmbed(posicion: posicion - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! EmbedViewController
        let posicion = viewController.posicion
        if posicion+1 < 3 {
            return crearViewControllerEmbed(posicion: posicion+1)
        }
        return nil
    }


}

