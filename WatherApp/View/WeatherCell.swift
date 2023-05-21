//
//  WatherCell.swift
//  WatherApp
//
//  Created by Olya Levandivska on 21.05.2023.
//

import SwiftUI

struct WeatherCell: View {
    var data: WeatherItem
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("\(Calendar.current.component(.day, from: data.dt)).\(Calendar.current.component(.month, from: data.dt)) \(Calendar.current.component(.hour, from: data.dt)):\(Calendar.current.component(.minute, from: data.dt))" )
                    .font(.largeTitle)
                Spacer()
                VStack(alignment: .leading){
                    Text("temp: \(Int(data.main.temp))")
                        .font(.callout)
                    Text("feels like: \(Int(data.main.feelsLike))")
                        .font(.callout)
                    Text("humidity: \(data.main.humidity)")
                        .font(.callout)
                }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width)
    }
}

//struct WatherCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCell(data: WeatherItem(dt: Date(), temp: 20.5, feelsLike: 21.5, description: "Suny", dtTxt: "19-07-2023 11:12:13"))
//    }
//}
