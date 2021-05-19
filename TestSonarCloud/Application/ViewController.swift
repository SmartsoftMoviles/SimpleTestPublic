//
//  ViewController.swift
//  TestSonarCloud
//
//  Created by Diego Cruz on 29/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableMascotas: UITableView!
    var listaMascotas = [Mascotas]()
    var imagenesAnimales = [aguila, gato, perro, hamster, tortuga]
    /// # LYFECICLE APP
    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionInicial()
    }
    /// # Funciones
    func configuracionInicial() {
        configureNavigationDefault()
        tableMascotas.dataSource = self
        tableMascotas.delegate = self
    }
    
    func moveTable() {
        if listaMascotas.count > 8 {
            let indexPath = IndexPath(row: listaMascotas.count - 1, section: 0)
            tableMascotas.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    /// # Aquí podemos mandar un mensaje personalizado en whatsapp
    func llamarWSP(mensaje: String) {
        //// # Mandar mensaje a un número de whatsapp
        /// https:// wa.me/ 5212311398424
        //// # Mandar mensaje a un número de whatsapp con un mensaje
        /// https:// api.whatsapp.com/ send/?phone=5212311398424&text=I%27m+interested+in+your+car+for+sale&app_absent=0
        let msj = mensaje
        print(msj)
//        let urlWhats = "whatsapp://send?text=\(msj)"
        let urlWhats = "https://" + "wa.me/5212311398424"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            guard let whatsappURL = NSURL(string: urlString) else { return }
            if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                UIApplication.shared.open(whatsappURL as URL)
            } else {
                print("Instala WhatsApp para poder continuar")
            }
        }
    }
    func abrirwspIFT() {
        let numberWSP = "5212311398424"
        let message = "Hola requiero informacion"
        let urlWhats = "whatsapp://" + "send?phone=\(numberWSP)&text=\(message)"
        var characterSet = CharacterSet.urlQueryAllowed
        characterSet.insert(charactersIn: "?&")
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: characterSet) {
            guard let whatsappURL = NSURL(string: urlString) else { return }
            if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                UIApplication.shared.open(whatsappURL as URL)
            } else {
                print("WhatsApp no está instalado")
            }
        }
    }
    func displayMyAlertMessage(_ title: String, userMessage: String) {
        let myAlert = UIAlertController(
            title: title, message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(
            title: TextosApp.btnAccep.rawValue, style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    /// #Add pet to list
    @IBAction func agregarMascotaNueva(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: TextosApp.addTitle.rawValue, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: TextosApp.btnCance.rawValue,
                                      style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = TextosApp.placeholder.rawValue
        })
        alert.addAction(UIAlertAction(title: TextosApp.btnAccep.rawValue, style: .default, handler: { [self] _ in
            if !alert.textFields!.first!.text!.isEmpty, let name = alert.textFields?.first?.text {
                listaMascotas.append(Mascotas(nombre: name, imagen: imagenesAnimales.randomElement()!))
                tableMascotas.reloadData()
                moveTable()
            } else {
                displayMyAlertMessage(MSJAddMascota.msjTitle.rawValue, userMessage: MSJAddMascota.msjMessage.rawValue)
            }
        }))
        self.present(alert, animated: true)
    }
    /// #Send message action
    @IBAction func sendWSP(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: TextosApp.titleAlert.rawValue,
                                      message: TextosApp.msjAlert.rawValue,
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "WhatsApp 1", style: .default, handler: { [self] _ in
                                        llamarWSP(mensaje: "Hola")
                                      }))
        alert.addAction(UIAlertAction(title: "WhatsApp 2", style: .default, handler: { [self] _ in
                                        abrirwspIFT()
                                      }))
        alert.addAction(UIAlertAction(title: TextosApp.btnCance.rawValue,
                                      style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: OTHER SOURCES
/// # Extensión: Tabla
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMascotas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listaMascotas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TextosApp.cellID.rawValue)
        cell?.textLabel?.text = item.nombre
        cell?.textLabel?.numberOfLines = 0
        cell?.imageView?.clipsToBounds = true
        cell?.imageView?.frame.size = CGSize(width: 24, height: 24)
        cell?.imageView?.layer.cornerRadius = 10
        cell?.imageView?.image = UIImage(named: item.imagen)
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listaMascotas[indexPath.row]
        let message = "\(item.nombre) es un \(item.imagen)"
        let message2 = "\(item.nombre) es una \(item.imagen)"
        let msjInfo = item.imagen == "tortuga" ? message2 : message
        displayMyAlertMessage(TextosApp.msjTittle.rawValue, userMessage: msjInfo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

/// # Extensión: Barra de navegación
extension UIViewController {
    func configureNavigationDefault() {
        title = TextosApp.titleApp.rawValue
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.blue
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.titleTextAttributes = titleDict as?
            [NSAttributedString.Key: Any]
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.blue]
    }
}
