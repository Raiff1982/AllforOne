# Changelog

## [1.0.3] - 2024-10-29
### Added
- Error handling for missing rotation files.
- Defensive programming to ensure `uiColor` is properly initialized.
- Slash command `/allforoneinfo` to display addon information.

### Changed
- Improved event handling for `GetSpecialization` function to handle cases where it might not be available.
- Enhanced logging for better debugging and tracking of events.
- Updated UI elements to ensure proper initialization and error handling.

### Fixed
- Fixed issue with `uiColor` being `nil` in the color picker callback.
- Fixed multiple errors related to missing rotation files for various classes.
- Fixed unhandled events causing errors during addon initialization.

## [1.0.2] - 2024-10-28
### Added
- Command `/allforone settings` to open the settings panel.
- Emergency spell prioritization logic.
- Enhanced customization options for players.
- Improved macro creation functionality.
- Tutorial functionality with a series of tutorial messages and navigation buttons.
- Slash commands to open the settings panel (`/allforonesettings`) and to show the tutorial (`/allforonetutorial`).

### Changed
- Updated rotation logic to suggest skills instead of casting them automatically to comply with Blizzard's rules.
- Improved logging for various events to help with debugging and tracking.
- Enhanced UI elements including a main frame, toggle button, close button, text box, settings button, and settings panel.
- Improved event handling to ensure the addon initializes correctly.
- Settings panel now includes options to adjust UI size, color, and customize spell sequences.

## [1.0.1] - 2024-10-26
### Changed
- Updated rotation logic to suggest skills instead of casting them automatically to comply with Blizzard's rules.
- Improved logging for various events to help with debugging and tracking.
- Enhanced UI elements including a main frame, toggle button, close button, text box, settings button, and settings panel.
- Improved event handling to ensure the addon initializes correctly.

## [1.0.0] - 2024-10-26
### Added
- Initial release of AllforOne.
- Automated rotation logic for all classes and specializations.
- Minimap button to toggle rotation on/off.
- Movable text box for displaying messages.
- Settings panel to adjust UI size and color.
- Logging functionality for various events.
- Command `/allforone toggle` to enable/disable rotation.
- Button to create a macro for toggling rotation.
- Compatibility with both Retail and Classic versions of World of Warcraft.