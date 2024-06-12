import UIKit

class ViewController: UIViewController {
    
    var isDarkModeEnabled = false
    var valueLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        let label = UILabel()
        label.text = "Hello, Sumit!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Button
        let button = UIButton(type: .system)
        button.setTitle("Click Me", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // TextField
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        // Slider
        let slider = UISlider()
           slider.minimumValue = 0
           slider.maximumValue = 100
           slider.value = 50
           slider.translatesAutoresizingMaskIntoConstraints = false
           slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged) // Added target
           view.addSubview(slider)
        
        // Switch
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        view.addSubview(switchControl)
        
        // ImageView
        let imageView = UIImageView(image: UIImage(named: "img"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // Segmented Control
        let segmentedControl = UISegmentedControl(items: ["Red", "Green", "Blue"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        valueLabel = UILabel()
             valueLabel.textAlignment = .center
             valueLabel.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(valueLabel)
        // Constraints
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            slider.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            switchControl.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            switchControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 60),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            segmentedControl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 70),
            valueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            valueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    @objc func buttonClicked() {
        print("Button clicked!")
    }
    
    @objc func switchToggled(_ sender: UISwitch) {
        isDarkModeEnabled = sender.isOn
        updateAppearance()
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
           // Update label text with slider value
           valueLabel.text = "Slider Value: \(Int(sender.value))"
    }
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .green
        case 2:
            view.backgroundColor = .blue
        default:
            break
        }
    }
    
    func updateAppearance() {
        if isDarkModeEnabled {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .white
        }
    }
}
