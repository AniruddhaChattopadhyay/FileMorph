import SwiftUI

struct ContentView: View {
    @State private var inputFilePath: String = ""
    
    var body: some View {
        VStack {
            Text("Universal File Converter")
                .font(.largeTitle)
                .padding()
            
            if !inputFilePath.isEmpty {
                Text("Selected File: \(inputFilePath)")
                    .padding()
                
                Button("Convert to JPEG") {
                    convertImage(to: "jpg")
                }
                .padding()
            }
        }
        .onAppear {
            if let filePath = CommandLine.arguments.dropFirst().first {
                self.inputFilePath = filePath
            }
        }
    }
    
    func convertImage(to format: String) {
        let inputURL = URL(fileURLWithPath: inputFilePath)
        let outputURL = inputURL.deletingPathExtension().appendingPathExtension(format)
        
        if let image = NSImage(contentsOf: inputURL),
           let tiffData = image.tiffRepresentation,
           let bitmap = NSBitmapImageRep(data: tiffData),
           let outputData = bitmap.representation(using: .jpeg, properties: [:]) {
            try? outputData.write(to: outputURL)
        }
    }
}
