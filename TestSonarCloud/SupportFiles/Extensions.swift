//
//  Extensions.swift
//  TestSonarCloud
//
//  Created by Diego Cruz on 05/05/21.
//

import Foundation

var aguila = "aguila"
var gato = "gato"
var perro = "perro"
var hamster = "hamster"
var tortuga = "tortuga"

/// # Enumeracion: Textos de la App
enum TextosApp: String {
    case addTitle = "Agregar mascota"
    case titleAlert = "Compartir en WhatsApp"
    case msjAlert = "Selecciona una opción"
    case placeholder = "Agregue el nombre de su mascota"
    case btnTitle = "Agregar"
    case btnAccep = "Aceptar"
    case btnCance = "Cancelar"
    case titleApp = "Mis mascotas"
    case cellID = "cellListaMascotas"
    case imageSimple = "defaultImage"
    case msjTittle = "Información"
}

enum MSJAddMascota: String {
    case msjTitle = "Información"
    case msjMessage = "Ingrese el nombre de su mascota para poder guardar el registro."
}

struct Mascotas {
    var nombre: String
    var imagen: String
}
