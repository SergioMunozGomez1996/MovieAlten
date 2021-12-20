//
//  FullScreenModalView.swift
//  MovieAlten
//
//  Created by Sergio Muñoz on 20/12/21.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var imageURL : String

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button("back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Button("save") {

                            let imageSaver = ImageSaver()
//                        imageSaver.writeToPhotoAlbum(image: image.)
                    }
                }
                .padding()
                
                AsyncImage(url: URL(string: imageURL )) { image in
                    image.resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    Color.red
                }

            }
        }
    }
    
//    func save(image : Image) {
//        guard let processedImage = image else { return }
//
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: UIImage(named: processedImage))
//    }
}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView( imageURL: "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg")
    }
}
