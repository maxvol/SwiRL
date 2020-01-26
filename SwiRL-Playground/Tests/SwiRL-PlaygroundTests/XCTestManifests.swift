import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiRL_PlaygroundTests.allTests),
    ]
}
#endif
