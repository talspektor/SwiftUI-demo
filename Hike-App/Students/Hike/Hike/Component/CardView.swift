//
//  CardView.swift
//  Hike
//
//  Created by Tal Spektor on 22/06/2024.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomeNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTION
    
    func randomImage() {
        print("----- BUTTON WAS PRESSED -----")
        print("Status: Old image number = \(imageNumber)")
        repeat {
            randomeNumber = Int.random(in: 1...5)
        } while randomeNumber == imageNumber
        
        imageNumber = randomeNumber
        
        print("Result: New image number = \(imageNumber)")
    }


    
    var body: some View {
        // MARK: - CARD

        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight,
                                             .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activity for freands and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT


                ZStack {
                    CustomCircleView()
                              
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK: - FOOTER
                
                Button {
                    // ACTION: Generate a randome number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
