import XCTest
@testable import FoodTracker

class MealTests: XCTestCase {

    func test_Meal_valid_init() {
        let zeroRatingMeal = Meal(name: "This is name", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)

        let fiveRatingMeal = Meal(name: "This is name", photo: nil, rating: 5)
        XCTAssertNotNil(fiveRatingMeal)
    }
    
    func test_Mean_invalid_init() {
        let underZeroRatingMeal = Meal(name: "This is name", photo: nil, rating: -1)
        XCTAssertNil(underZeroRatingMeal)

        let emptyNameMeal = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyNameMeal)
    }
}
