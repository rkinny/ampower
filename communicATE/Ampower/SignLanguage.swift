//
//  EmotionsDetector.swift
//  communicATE
//
//  Created by Diya Dinesh on 2/2/24.
//
import CoreML
import UIKit
import SwiftUI
import AVKit
import Vision

struct ViewControllerViewTwo: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: SignLanguage, context: Context) {
        //
    }
    
    func makeUIViewController(context: Context) -> SignLanguage {
        // this will work if you are not using Storyboards at all.
        return SignLanguage()
    }
}
class SignLanguage: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    
    var nameLabel = UILabel()
    var sign = UILabel ()
    let button_blue = UIColor(red:33/255,green:84/255,blue:146/255, alpha:1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel = UILabel(frame:CGRect(x:140 , y:50 , width: 150 , height: 40) )

        
        sign = UILabel(frame:CGRect(x:-30 , y:20, width: 500 , height: 80) )
        sign.textAlignment = .center

        nameLabel = UILabel(frame:CGRect(x:140 , y:100 , width: 150 , height: 40) )
        let spacer = UIView()
        
        self.view.backgroundColor = .white
        self.view.addSubview(sign)
        self.view.addSubview(spacer)
        self.view.addSubview(nameLabel)
        sign.font = UIFont(name: "BubbleNorthRegular", size:45)
        sign.textColor = button_blue
        sign.backgroundColor = .white
        sign.text = "Sign Language"
        sign.textAlignment = NSTextAlignment.center
        sign.numberOfLines = 0;
        sign.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        nameLabel.font = UIFont(name: "BubbleNorthRegular", size:30)

        nameLabel.textColor = button_blue
                nameLabel.text = ""
                nameLabel.textAlignment = NSTextAlignment.center
                nameLabel.numberOfLines = 0;
                nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLabel.layer.borderColor = button_blue.cgColor
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.cornerRadius = 10
        
        
                let captureSession = AVCaptureSession()
                captureSession.sessionPreset = .photo
                
                guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
                guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
                captureSession.addInput(input)
                
                
                captureSession.startRunning()
                
                let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    
                    
                
                view.layer.addSublayer(previewLayer)
                previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
                
            }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        
        guard let model = try? VNCoreMLModel(for: signlanguage().model) else {return}
        let request = VNCoreMLRequest(model: model){ (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
            
            guard let firstObservation = results.first else {return}
            
            print(firstObservation.identifier, firstObservation.confidence)
            DispatchQueue.main.async{self.nameLabel.text = String(firstObservation.identifier)}
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
        
    }
    


#Preview {
    SignLanguage()
}
