import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    let factory = CipherFactory()
    var cipher: Cipher!
    @IBOutlet weak var cipherType: UISegmentedControl!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        cipher = CeaserCipher()
    }
    
    
    @IBAction func setType(_ sender: Any) {
        
        let allCiphers = ["cesar", "alphanumcesar", "ROT13", "subcipher"]
        cipher = self.factory.cipher(for: allCiphers[cipherType.selectedSegmentIndex])
        print ("Cipher is: \(allCiphers[cipherType.selectedSegmentIndex])")
    }
    
    
    @IBAction func decodeButtonPressed(_ sender: Any) {
        
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.decode(output.text!, secret: secret)
    }
    
    // We will talk about this method during lecture
   
    @IBAction func encodeButtonPressed(_ sender: Any) {
        
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
        
    }
    
    
    
    
}

