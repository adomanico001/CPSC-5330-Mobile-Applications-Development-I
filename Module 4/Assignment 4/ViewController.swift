//
//  ViewController.swift
//  Module 4 Assignment
//
//  Created by Addie Domanico on 11/10/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Labels to display live time and countdown timer
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var startTimerButton: UIButton!
    @IBOutlet weak var countdownTimer: UIDatePicker!
    @IBOutlet weak var label2: UILabel!

    
    // Timer to update time every second
    var timer: Timer?
    var totalSeconds = 0
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackgroundImage()
        setupStartTimerButton()
        setupInitialUI()
        playMusic()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func setupInitialUI() {
        label2.text = formatTime(totalSeconds)
        countdownTimer.countDownDuration = 60
    }
    
    func setupStartTimerButton() {
        startTimerButton.layer.borderWidth = 2.0
        startTimerButton.layer.borderColor = UIColor.black.cgColor
        startTimerButton.layer.cornerRadius = 8.0
    }
    
    @IBAction func startStopButtonClicked(_ sender: UIButton) {
        if startTimerButton.title(for: .normal) == "Start Timer" {
            startCountdown()
        } else {
            stopMusic()
        }
    }
    
    func startCountdown() {
        totalSeconds = Int(countdownTimer.countDownDuration)
        label2.isEnabled = false
        startTimerButton.setTitle("Stop Timer", for: .normal)
        label2.textColor = .white
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        label2.textColor = .white
        
        if totalSeconds > 0 {
            totalSeconds -= 1
            label2.text = "Time Remaining: \(formatTime(totalSeconds))"
        } else {
            timer?.invalidate()
            playMusic()
            startTimerButton.setTitle("Stop Music", for: .normal)
        }
    }
    
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "alarm_siren", ofType: "mp3") else {
            print("Sound file not found.")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
        resetTimer()
    }
    
    func resetTimer() {
        label2.text = formatTime(Int(countdownTimer.countDownDuration))
        startTimerButton.setTitle("Start Timer", for: .normal)
        label2.isEnabled = true
    }
    
    func formatTime(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    @objc func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss"
        let currentTime = dateFormatter.string(from: Date())
        label1.text = currentTime
        
        updateBackgroundImage()
    }
    
    func updateBackgroundImage() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        let imageName = hour < 12 ? "Sunrise" : "Night"
        
        if let backgroundImage = UIImage(named: imageName) {
            backgroundImageView.image = backgroundImage
        } else {
            print("Error: Image \(imageName) not found in assets.")
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
