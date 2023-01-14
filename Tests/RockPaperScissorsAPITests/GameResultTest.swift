import XCTest
@testable import RockPaperScissorsAPI

private typealias GameResult = RockPaperScissors.GameResult

final class GameResultTest: XCTestCase {
    func testInitFrom() throws {
        XCTAssertEqual(GameResult.from(.rock, vs: .scissors), .win)
        XCTAssertEqual(GameResult.from(.rock, vs: .rock), .tie)
        XCTAssertEqual(GameResult.from(.rock, vs: .paper), .loss)
        XCTAssertEqual(GameResult.from(.paper, vs: .scissors), .loss)
        XCTAssertEqual(GameResult.from(.paper, vs: .rock), .win)
        XCTAssertEqual(GameResult.from(.paper, vs: .paper), .tie)
        XCTAssertEqual(GameResult.from(.scissors, vs: .scissors), .tie)
        XCTAssertEqual(GameResult.from(.scissors, vs: .rock), .loss)
        XCTAssertEqual(GameResult.from(.scissors, vs: .paper), .win)
    }
    func testInitFromRawValue() throws {
        XCTAssertEqual(GameResult.win.howToGet(vs: .rock), .paper)
        XCTAssertEqual(GameResult.loss.howToGet(vs: .rock), .scissors)
        XCTAssertEqual(GameResult.tie.howToGet(vs: .rock), .rock)
        XCTAssertEqual(GameResult.win.howToGet(vs: .paper), .scissors)
        XCTAssertEqual(GameResult.loss.howToGet(vs: .paper), .rock)
        XCTAssertEqual(GameResult.tie.howToGet(vs: .paper), .paper)
        XCTAssertEqual(GameResult.win.howToGet(vs: .scissors), .rock)
        XCTAssertEqual(GameResult.loss.howToGet(vs: .scissors), .paper)
        XCTAssertEqual(GameResult.tie.howToGet(vs: .scissors), .scissors)
    }
}
