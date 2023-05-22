//
//  WeatherDetailCell.swift
//  WatherApp
//
//  Created by Olya Levandivska on 22.05.2023.
//

import SwiftUI

struct WeatherDetailCell: View {
    var data: WeatherItem
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 30){
                Text("\(Calendar.current.component(.hour, from: data.dt)):\(Calendar.current.component(.minute, from: data.dt))" )
                    .font(.largeTitle)
                    .frame(width: 100)
                VStack(alignment: .leading){
                    Text("temp: \(Int(data.main.temp))°С")
                        .font(.callout)
                    Text("feels like: \(Int(data.main.feelsLike))°С")
                        .font(.callout)
                    Text("desc: \(data.weather[0].description)")
                        .font(.callout)
                    Text("humidity: \(data.main.humidity)")
                        .font(.callout)
                    Text("presure: \(data.main.pressure)")
                        .font(.callout)
                    Text("sea level: \(data.main.seaLevel)")
                        .font(.callout)
                }
            }.padding()
                .padding(.leading, 40)
        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

//struct WeatherDetailCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailCell()
//    }
//}
