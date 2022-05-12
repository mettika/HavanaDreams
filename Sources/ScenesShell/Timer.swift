import Foundation

func TimerRun() {
    var runCount = 0
    var timer: Timer?    
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        print("**DEFCON ONE. COCKED PISTOL, COCKED PISTOL. NUCLEAR FORCE AUTHORIZED. DEFCON ONE**")
        runCount += 1
        
        if runCount == 259200 {
            timer.invalidate()
        }    
    }
}
