//
//  TestSonarCloudUITests.swift
//  TestSonarCloudUITests
//
//  Created by Diego Cruz on 29/04/21.
//

import XCTest

class TestSonarCloudUITests: XCTestCase {
    var app: XCUIApplication!
    /// # FUNCIONES
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    // Boton compartir en WhatsApp
    func testwspButton() throws {
        let buttonWSP = app.navigationBars["Mis mascotas"].children(matching: .button).element(boundBy: 1)
        let sheets = app.sheets["Compartir en WhatsApp"].scrollViews.otherElements.buttons["WhatsApp 2"]
        buttonWSP.tap()
        sheets.tap()
        app.launch()
    }
    // Boton agregar una mascota
    func testAddPet() throws {
        let buttonPet = app.navigationBars["Mis mascotas"].children(matching: .button).element(boundBy: 0)
        buttonPet.tap()
        app.launch()
    }
    // Performance app
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
