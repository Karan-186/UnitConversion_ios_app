//
//  ContentView.swift
//  Own_1_UnitConversion
//
//  Created by KARAN  on 25/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var userinput = 1
    @State var inUnit = "km"
    @State var outUnit = "m"
    @FocusState private var isFocused : Bool
    
    let selection = ["km","m","miles"]
    
    var conversion : Double {
        
        let uservalue = Double(userinput)
        
        if inUnit == outUnit {
            return Double(uservalue)
        }
        
        else{
            if inUnit=="m"{
                let m_to_km = uservalue / 1000
                if outUnit=="km"{
                    return m_to_km
                }
                else{
                    return m_to_km / 1.6
                }
            }
            else if inUnit=="miles"{
                let miles_to_km = uservalue * (1.6)
                if outUnit=="km"{
                    return miles_to_km
                }
                else{
                    return miles_to_km * 1000
                }
            }
            else{
                let value_from_km = uservalue
                if outUnit == "m"{
                    return value_from_km * 1000
                }
                else {
                    return value_from_km / 1.6
                }
            }
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    Picker("input Dimension",selection: $inUnit){
                        ForEach(selection, id:\.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("From")
                }
                
                
                
                
                Section{
                    Picker("Output Dimension",selection: $outUnit){
                        ForEach(selection , id:\.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("TO")
                }
                
                
                
                Section{
                    TextField("input",value: $userinput , format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }header: {
                    Text("Input")
                }
                
                
                
                Section{
                    Text(conversion,format: .number)
                }header: {
                    Text("Output")
                }
            }
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
