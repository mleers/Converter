//
//  ContentView.swift
//  Converter
//
//  Created by Mitch on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTempType = "Celsius"
    @State private var outputTempType = "Fahrenheit"

    @State private var inputVal = 0.0
    @State private var outputVal = 0.0
    
    let tempTypes = ["Celsius", "Fahrenheit", "Kelvin"]

    var outputResult: Measurement<UnitTemperature> {
        let degreesC = Measurement(value: inputVal, unit: UnitTemperature.celsius)
        let degreesF = Measurement(value: inputVal, unit: UnitTemperature.fahrenheit)
        let degreesK = Measurement(value: inputVal, unit: UnitTemperature.kelvin)
        
        
        if inputTempType == "Celsius" && outputTempType == "Fahrenheit" {
            return degreesC.converted(to: UnitTemperature.fahrenheit)
        } else if inputTempType == "Celsius" && outputTempType == "Kelvin" {
            return degreesC.converted(to: UnitTemperature.kelvin)
        } else if inputTempType == "Fahrenheit" && outputTempType == "Celsius" {
            return degreesF.converted(to: UnitTemperature.celsius)
        } else if inputTempType == "Fahrenheit" && outputTempType == "Kelvin" {
            return degreesF.converted(to: UnitTemperature.kelvin)
        } else if inputTempType == "Kelvin" && outputTempType == "Celsius" {
            return degreesK.converted(to: UnitTemperature.celsius)
        } else {
            return degreesK.converted(to: UnitTemperature.fahrenheit)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", value: $inputVal, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Input type", selection: $inputTempType) {
                        ForEach(tempTypes, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                    Picker("Output type", selection: $outputTempType) {
                        ForEach(tempTypes, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                }
                
                Section {
                    if inputTempType == outputTempType {
                        Text("\(inputVal)")
                    } else { Text("\(outputResult.value)") }
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
