//
//  CrearDatagramas.swift
//  Particion
//
//  Created by Loquat Solutions on 8/7/17.
//  Copyright © 2017 MHP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class CrearDatagramas {    
    var particionDatagramas : [[UInt8]] = []
    func particion (_ datagrama : [UInt8]) -> [[UInt8]] {
        if (datagrama.count > 17)
        {
            particionDatagramas.append([UInt8]([18]+datagrama[0...17]))
            return particion([UInt8](datagrama[17...datagrama.count-1]))
        }
        else{
            particionDatagramas.append([UInt8(datagrama.count)]+datagrama)
            return particionDatagramas
        }
    }
    
    
    
    func particion (_ datagramaString : String) -> [[UInt8]] {
        var datagrama : [UInt8] = []
        datagrama = [UInt8](datagramaString.utf8)
        if (datagrama.count > 17)
        {
            particionDatagramas.append([UInt8]([18]+datagrama[0...17]))
            return particion([UInt8](datagrama[17...datagrama.count-1]))
        }
        else{
            particionDatagramas.append([UInt8(datagrama.count)]+datagrama)
            return particionDatagramas
        }
    }
    
   
    enum Errorcito : Error {
        case DivisionError
    }
    
    func consulta (_ callBack:  @escaping ([Int]) -> Void) throws  {
        var numeros = [Int]()
        for i in 0...10000{
            
              numeros.append(i)
            if numeros[i] == 1000000 {
                throw Errorcito.DivisionError
            }
            
    
            
            
        }
        let delayTime = DispatchTime.now()  + 3
               DispatchQueue.main.asyncAfter(deadline: delayTime ){
          callBack(numeros)
        }
        
    }
    enum Constantes {
        let URLPeticiones = "https://detres/detres/api/"
    }

    
    func loadDetail(urlPath: String, completionHandler: ((UIBackgroundFetchResult)     -> Void)!){
        Alamofire.request(Constantes.URLPeticiones + "comentarios_addComentario", method: .post, parameters: nil, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let respuesta = Respuesta.init(data: JSON(value))
                
                if respuesta.error == nil {
                    //callback(respuesta.data!.stringValue, nil)
                }
                else {
                    //TODO: Tratar error
                    print("OTRO ERROR")
                    //callback(ficheros: nil, error: error)
                }
                
            case .failure(let error):
                callback(nil, error as NSError?)
            }
            
            HUD.hide()
        }
        
        print("Background Fetch Complete")
    }
    
}
