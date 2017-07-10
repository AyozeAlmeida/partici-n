//
//  ViewController.swift
//  Particion
    //
//  Created by Loquat Solutions on 8/7/17.
//  Copyright © 2017 MHP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var progreso: UIProgressView!

    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       //var particionDatagrama: [[UInt8]] = []
       let particionDatagrama = CrearDatagramas()
       
        
        
        print (particionDatagrama.particion([20, 20, 20 ,34, 45, 50, 20, 20, 20, 34, 45, 50, 20, 20, 20 ,34, 45, 50, 20, 20, 20 ,34, 45, 50, 20, 20, 20 ,34, 45, 50, 20, 20, 20 ,34, 45, 50]))
            
        
      
        do {
            try particionDatagrama.consulta { numeros in
                
                
                print("este es el numero del array",numeros[1000])
                
            
            }
            
        }
        catch is Error {
                print("fallo")
        }
        
        
        
        let prueba : String = "hola a ver como convierto esto y que siga bonito el dia de hoy "
      
        print (particionDatagrama.particion(prueba))
        
        enum MyError: Error {
            case FoundNil(String)
        }
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = UIColor.orange
        progress.tag = 10000
        self.view?.addSubview(progress)
        var contador = 0


        _ = #selector(viewDidLoad)
        DispatchQueue.global(qos: .background).async { [unowned self] in
            for i in 0...100 {
                
           
                
                
                if ( i % 2 == 0){
                
                       // print (i)
                    
                
                }else {
                    DispatchQueue.main.async {
                       
                            contador += 2
                            let calculo = contador
                            progress.setProgress(Float(calculo), animated: true)
                            print ("otro hilo\(contador)")
                        
                    }
                }
    
            }
        }


    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

