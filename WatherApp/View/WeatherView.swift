//
//  WatherView.swift
//  WatherApp
//
//  Created by Olya Levandivska on 21.05.2023.
//

import SwiftUI
import AlertToast

struct WeatherView: View {
    
    @ObservedObject var viewModel = WeatherViewModel()
    
    let placeholderText = "Київ, Україна"
    @State var address = ""
    
    var body: some View {
        VStack{
            NavigationStack{
                HStack{
                    TextField(placeholderText, text: $address)
                        .padding(5)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    Button("Search"){
                        viewModel.updateWeather(address: address)
                    }.padding(8)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }.padding()
                
                Text("Location: \(viewModel.currentLocation)")
                    .font(.title3)
                
                VStack{
                    List{
                        ForEach(viewModel.weathers, id: \.self){ weather in 
                            NavigationLink {
                                WeatherDetailView(weather: weather, location: viewModel.currentLocation)
                            } label: {
                                WeatherCell(dateStr: weather.dateStr, averageTemp: weather.averageTemp)
                            }
                        }
                    }
                }
            }
        }.toast(isPresenting: $viewModel.loader){
            AlertToast(type: .loading)
        }
        .toast(isPresenting: $viewModel.showError){
            AlertToast(type: .error(.red), title: viewModel.error)
        }
        .toast(isPresenting: $viewModel.successActionAlerrt){
            AlertToast(type: .complete(.green), title: "Updated")
        }
    }
}


//struct WatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView(cellsData: [WeatherItem(dt: Date(), temp: 23.5, feelsLike: 24.5, description: "Suny", dtTxt: "wrrkjn")])
//    }
//}
