open class Bowling {
    public init() {}

    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0


    public func roll(pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }

    public func getScore() -> Int {
        var score = 0
        var rollIndex = 0
        for _ in 1...10 {
            if isStrike(rollIndex: rollIndex) {
              score += 10 + strikeBonus(rollIndex: rollIndex)
                rollIndex += 1
            } else if isSpare(rollIndex: rollIndex) {
                score += 10 + spareBonus(rollIndex: rollIndex)
                rollIndex += 2
            } else {
                score += openFrameScore(rollIndex: rollIndex)
                rollIndex += 2
            }
        }
        return score
    }

    private func isStrike(rollIndex: Int) -> Bool {
        return rolls[rollIndex] == 10
    }

    private func strikeBonus(rollIndex: Int) -> Int {
        return rolls[rollIndex + 1] + rolls[rollIndex + 2]
    }

    private func isSpare(rollIndex: Int) -> Bool {
        return rolls[rollIndex] + rolls[rollIndex + 1] == 10
    }

    private func spareBonus(rollIndex: Int) -> Int {
        return rolls[rollIndex + 2]
    }

    private func openFrameScore(rollIndex: Int) -> Int {
        return rolls[rollIndex] + rolls[rollIndex + 1]
    }
}