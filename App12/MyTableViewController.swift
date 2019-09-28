//
//  MyTableViewController.swift
//  App12
//
//  Created by ENRIQUE VERGARA  on 9/27/19.
//  Copyright © 2019 ENRIQUE VERGARA . All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var alumnos = ["JOSE", "ENRIQUE", "LUIS", "ANGEL", "MARIANA", "PEDRITO"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = alumnos[indexPath.row]
        return cell
    }

    
    // MARK: Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cancelClosure = { ( action : UIAlertAction!) -> Void in
            print("Boton cancelar")
        }
        
        let alerta = UIAlertController(title: "Titulo", message: "Este es el mensaje", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelClosure)
        
        let borrarAction = UIAlertAction(title: "Borrar", style: .default) { (action) in
            self.alumnos.remove(at: indexPath.row)
            print(self.alumnos)
            tableView.reloadData()
        }
        alerta.addAction(cancelAction)
        alerta.addAction(borrarAction)
        present(alerta, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alumnos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        } else if editingStyle == .insert {
            print("insert new")
        }
    }

}
