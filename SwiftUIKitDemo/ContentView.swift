//
//  ContentView.swift
//  SwiftUIKitDemo
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 9/24/20.
//  
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import SwiftUI
import SwiftUIKit

import MapKit

struct ContentView: View {
    @State var text = "Text to edit."

    let attributes: [NSAttributedString.Key : Any] = [.strokeWidth: -3.0,
                                                      .strokeColor: UIColor.blue,
                                                      .foregroundColor: UIColor.red]

    var body: some View {
        List {
            TextField("Title", text: $text)
                .accentColor(.green)

            UIKitComponentRow(
                UIKLabel {
                    $0.attributedText = NSAttributedString(string: "This is an original UILabel.", attributes: attributes)
                    $0.font = .systemFont(ofSize: 20)
                    $0.numberOfLines = 0
                }
            )

            UIKitComponentRow(
                UIKActivityIndicatorView {
                    $0.startAnimating()
                }
            )

            UIKitComponentRow(
                UIKSwitch {
                    $0.isOn = true
                }
            )

            UIKitComponentRow(
                UIKSlider {
                    $0.value = 0.7
                }
            )

            UIKitComponentRow(
                UIKProgressView {
                    $0.progress = 0.3
                }
            )

            UIKitComponentRow(
                UIKTextField(text: $text) {
                    $0.tintColor = .red
                }
            )

            UIKitComponentRow(
                UIKTextView(text: $text) {
                    $0.tintColor = .red
                    $0.font = .systemFont(ofSize: 16)
                }
            ).frame(height: 100)

            UIKitComponentRow(
                UIKMapView {
                    $0.showsUserLocation = true
                }
            ).frame(height: 100)
        }
    }
}

struct UIKitComponentRow: View {
    let title: String
    let view: AnyView

    var body: some View {
        HStack {
            Text(title)

            Spacer()

            view
        }
    }

    init<T: View>(_ view: T) {
        self.title = String(describing: type(of: view))
        self.view = AnyView(view)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
