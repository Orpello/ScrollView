//
//  ImageViewController.swift
//  ScrollView
//
//  Created by Gianluca Orpello on 14/01/21.
//

import UIKit
import SafariServices
import MessageUI

class ImageViewController: UIViewController, UIScrollViewDelegate,
                           UIImagePickerControllerDelegate, UINavigationControllerDelegate,
                           MFMailComposeViewControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        scrollView.minimumZoomScale = 0.4
        scrollView.maximumZoomScale = 2
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    @IBAction func shareImage(_ sender: UIBarButtonItem) {
        
        
        let alertController = UIAlertController(title: "Share Items",
                                                message: "Select the actions",
                                                preferredStyle: .actionSheet)
        
        
        
        let activityControllerAction = UIAlertAction(title: "Share",
                                                     style: .default) { (action) in
            
            
            guard let image = self.imageView.image else { return }
            
            let activityController = UIActivityViewController(activityItems: [image],
                                                              applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        
        let safariAction = UIAlertAction(title: "Open Documentations",
                                         style: .default) { (action) in
            
            guard let url = URL(string: "https://www.apple.com") else { return }
            
            let safariViewController = SFSafariViewController(url: url)
            
            self.present(safariViewController, animated: true, completion: nil)
            
        }
        
        
        let cameraOrLibraryAction = UIAlertAction(title: "Select New Photo",
                                                  style: .default) { (action) in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            
            self.present(imagePicker, animated: true, completion: nil)
            
            
        }
        
        let mailAction = UIAlertAction(title: "Report Bug..",
                                       style: .destructive) { (action) in
            
            guard MFMailComposeViewController.canSendMail() else {
                print("Can't send email...")
                return
            }
            
            let mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = self
            mailController.setToRecipients(["example@example.com"])
            mailController.setSubject("Please Read ASAP !!!")
            mailController.setMessageBody("Secret Message !!", isHTML: false)
            
            self.present(mailController, animated: true, completion: nil)
            
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { (action) in
            
        }
        
        alertController.addAction(activityControllerAction)
        alertController.addAction(safariAction)
        alertController.addAction(cancelAction)
        alertController.addAction(cameraOrLibraryAction)
        alertController.addAction(mailAction)
        
        present(alertController, animated: true, completion: nil)
        

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
