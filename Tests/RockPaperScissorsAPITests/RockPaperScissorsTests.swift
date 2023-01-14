import XCTest
@testable import RockPaperScissorsAPI

final class RockPaperScissorsTests: XCTestCase {
    func testInitFromString() throws {
        XCTAssertEqual(RockPaperScissors.init(string: "rock"), .rock)
        XCTAssertEqual(RockPaperScissors.init(string: "paper"), .paper)
        XCTAssertEqual(RockPaperScissors.init(string: "scissors"), .scissors)
        XCTAssertEqual(RockPaperScissors.init(string: "Rock"), .rock)
        XCTAssertEqual(RockPaperScissors.init(string: "Paper"), .paper)
        XCTAssertEqual(RockPaperScissors.init(string: "Scissors"), .scissors)
        XCTAssertEqual(RockPaperScissors.init(string: "r"), .rock)
        XCTAssertEqual(RockPaperScissors.init(string: "p"), .paper)
        XCTAssertEqual(RockPaperScissors.init(string: "s"), .scissors)
    }
    func testInitFromRawValue() throws {
        XCTAssertEqual(RockPaperScissors.init(rawValue: 1), .rock)
        XCTAssertEqual(RockPaperScissors.init(rawValue: 2), .paper)
        XCTAssertEqual(RockPaperScissors.init(rawValue: 3), .scissors)
    }
    func testRockPaperScissorsComparisons() throws {
        XCTAssertEqual(RockPaperScissors.rock, .rock)
        XCTAssertLessThan(RockPaperScissors.rock, .paper)
        XCTAssertGreaterThan(RockPaperScissors.rock, .scissors)
        //
        XCTAssertGreaterThan(RockPaperScissors.paper, .rock)
        XCTAssertEqual(RockPaperScissors.paper, .paper)
        XCTAssertLessThan(RockPaperScissors.paper, .scissors)
        //
        XCTAssertLessThan(RockPaperScissors.scissors, .rock)
        XCTAssertGreaterThan(RockPaperScissors.scissors, .paper)
        XCTAssertEqual(RockPaperScissors.scissors, .scissors)
    }
}
