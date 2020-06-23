//
//  HerosTableViewController.swift
//  Heros
//
//  Created by Marcelo Block Teixeira on 10/06/20.
//  Copyright © 2020 Marcelo Block Teixeira. All rights reserved.
//

import UIKit

class HerosTableViewController: UITableViewController {
    
    var name: String?
    let apiMarvelClass = ApiController()
    var resultHeros: [Result] = []
   var label: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.textColor = .white
       return label
   }()
    var loadingHeros = false
    var totalHeros = 0
        var currentPage = 0
    

  override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando Herois. Aguarde..."
        loadHeros()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        
        vc.hero = resultHeros[tableView.indexPathForSelectedRow!.row]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Table view data source
    
    func loadHeros () {
        loadingHeros = true
        ApiController.getData(name: name, page: currentPage) { (apiMarvelData) in
                if let apiMarvelData = apiMarvelData {
                    self.resultHeros += apiMarvelData.data.results
                    self.totalHeros = apiMarvelData.data.total
                    print("total:", self.totalHeros, "- Já incluidos:", self.resultHeros.count)
                    print(self.resultHeros)
                    DispatchQueue.main.async {
                        self.loadingHeros = false
                        self.tableView.reloadData()
                    }
                }
            }
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        tableView.backgroundView = resultHeros.count == 0 ? label : nil
        return resultHeros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        
        let hero = resultHeros[indexPath.row]
        
        cell.prepereCell(with: hero)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == resultHeros.count - 10 && !loadingHeros && resultHeros.count != totalHeros {
            currentPage += 1
            loadHeros()
            print("carregando herois")
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
