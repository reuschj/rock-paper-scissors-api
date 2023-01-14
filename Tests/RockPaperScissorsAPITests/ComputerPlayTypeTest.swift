import XCTest
@testable import RockPaperScissorsAPI

private typealias CPT = RockPaperScissors.ComputerPlayType

final class ComputerPlayTypeTest: XCTestCase {
    func testInitFromString() throws {
        XCTAssertEqual(CPT.init(string: "random"), .random)
        XCTAssertEqual(CPT.init(string: "alwayswin"), .computerAlwaysWins)
        XCTAssertEqual(CPT.init(string: "alwayslose"), .computerAlwaysLoses)
        XCTAssertEqual(CPT.init(string: "alwaysmatch"), .computerAlwaysMatches)
        XCTAssertEqual(CPT.init(string: "r"), .random)
        XCTAssertEqual(CPT.init(string: "win"), .computerAlwaysWins)
        XCTAssertEqual(CPT.init(string: "lose"), .computerAlwaysLoses)
        XCTAssertEqual(CPT.init(string: "match"), .computerAlwaysMatches)
    }
    func testInitFromRawValue() throws {
        XCTAssertEqual(CPT.init(string: "random"), .random)
        XCTAssertEqual(CPT.init(string: "computerAlwaysWins"), .computerAlwaysWins)
        XCTAssertEqual(CPT.init(string: "computerAlwaysLoses"), .computerAlwaysLoses)
        XCTAssertEqual(CPT.init(string: "computerAlwaysMatches"), .computerAlwaysMatches)
    }
}
