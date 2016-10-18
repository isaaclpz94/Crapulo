//
//  ViewController.swift
//  Crapulo
//
//  Created by Isaac Mac on 28/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var suma : Int = 0
    var primero = true
    var numero:String = ""

    @IBOutlet var TFNumero: UITextField!
    
    @IBOutlet var LBRes: UILabel!
    
    @IBAction func BTNRes(sender: UIButton) {
        if TFNumero.hasText(){ //si el user ha escrito algo en el texfield
            if isValidEmail(TFNumero.text){
                
            
            
            primero = true
            
            do{
                
                if primero{ //si es la primera vez
                    numero = TFNumero.text
                    primero=false
                }else{
                    numero = String(suma)
                }
                var array  = [Character]()
            
                for index in numero{
                    array.append(index)
                }
            
                println("Los numeros son: \(array)")
            
                suma = 0
                for num in array{
                    var numero:Int = String(num).toInt()! //Caracter to int
                    suma = suma + numero
                }
            }while suma > 10
                
            LBRes.text = String(suma)
            }else{
                LBRes.text = "Inserte un número válido"
            }
            
        }else{
            LBRes.text = "Inserte un número"
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {

        let emailRegEx = "[0-9]+"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

