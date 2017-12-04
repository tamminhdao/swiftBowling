import Foundation
import Quick
import Nimble
import bowling

class BowlingSpec: QuickSpec {
    override func spec() {
        describe ("#Bowling") {
            var game: Bowling!

            beforeEach {
                game = Bowling()
            }

            func rollMany(pins: Int, rolls: Int) {
                for _ in 1...rolls {
                    game.roll(pins: pins)
                }
            }

            it ("can roll a gutter game") {
                rollMany(pins: 0, rolls: 20)
                expect(game.getScore()).to(equal(0))
            }

            it ("can roll all ones") {
                rollMany(pins: 1, rolls: 20)
                expect(game.getScore()).to(equal(20))
            }

            it ("can roll a spare") {
                game.roll(pins: 5)
                game.roll(pins: 5)
                game.roll(pins: 3)
                rollMany(pins: 0, rolls: 17)
                expect(game.getScore()).to(equal(16))
            }

            it ("can roll a strike") {
                game.roll(pins: 10)
                game.roll(pins: 3)
                game.roll(pins: 4)
                rollMany(pins: 0, rolls: 16)
                expect(game.getScore()).to(equal(24))
            }

            it ("can roll a perfect game") {
                rollMany(pins: 10, rolls: 12)
                expect(game.getScore()).to(equal(300))
            }
        }
    }
}