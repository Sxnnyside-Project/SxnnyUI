import Testing
@testable import SxnnyUI

@Test func example() async throws {
    // Arrange: Create an instance of the view model
    let viewModel = FontWeightViewModel()

    // Act: Change the selected font weight
    viewModel.selectedFontWeight = .bold

    // Assert: Verify the selected font weight is updated
    #expect(viewModel.selectedFontWeight == .bold)
}
