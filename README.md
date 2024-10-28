AllforOne
AllforOne is a World of Warcraft addon designed to assist players by automating and suggesting rotation logic for all classes and specializations. It includes a user-friendly interface for adjusting settings and viewing logs.

Features
Automated Rotation Logic: Suggests skills instead of casting them automatically to comply with Blizzard’s rules.
Minimap Button: Toggle rotation on/off with a simple click.
Movable Text Box: Display messages and drag to reposition.
Settings Panel: Adjust UI size and color, and customize spell sequences.
Logging Functionality: Improved logging for various events to help with debugging and tracking.
Command /allforone toggle: Enable or disable the rotation logic.
Macro Creation: Button to create a macro for toggling rotation.
Compatibility: Works with both Retail and Classic versions of World of Warcraft.
Emergency Spells: Prioritizes emergency spells based on certain conditions to help players in critical situations.
Installation
Download the latest version of the addon.
Extract the contents to your World of Warcraft Interface\AddOns directory.
Ensure the folder structure looks like this:
Interface\AddOns\AllforOne\
+-- AllforOne.lua
+-- UI.lua
+-- AllforOne.toc
+-- DEATHKNIGHT.lua
+-- DEMONHUNTER.lua
+-- DRUID.lua
+-- HUNTER.lua
+-- MAGE.lua
+-- MONK.lua
+-- PALADIN.lua
+-- PRIEST.lua
+-- ROGUE.lua
+-- SHAMAN.lua
+-- WARLOCK.lua
+-- WARRIOR.lua

Usage
Toggle Rotation: Click the minimap button or use the command /allforone toggle.
Settings: Click the “Settings” button to open the settings panel.
Move Text Box: Drag the text box to reposition it.
Commands
/allforone toggle: Enable or disable the rotation logic.
Contributing
Feel free to submit issues or pull requests on the GitHub repository. Contributions are welcome!

Development Details
Programming Language: The addon is written in Lua, the primary scripting language for World of Warcraft addons.
Compliance: The addon complies with Blizzard’s rules by suggesting skills instead of casting them automatically.
Performance: While designed to be efficient, the complexity of the UI and logging features might slightly impact game performance on lower-end systems.
Customization: The settings panel allows for UI customization, but advanced configurations might require further development.
Updates: Regular updates are necessary to maintain compatibility with new game patches and expansions.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Documentation
For detailed information on installation, usage, and features, visit the AllforOne CurseForge page or the GitHub repository.

Frequently Asked Questions (FAQ)
Q1: How do I install AllforOne?

A: You can install AllforOne by downloading it from CurseForge or GitHub. Extract the downloaded file into your World of Warcraft Interface/AddOns directory.
Q2: How do I access the settings for AllforOne?

A: Type /allforone in the chat to open the settings panel. Here, you can customize various aspects of the addon to suit your preferences.
Q3: How do I enable or disable the rotation feature?

A: You can toggle the rotation feature by clicking the minimap button or by typing /allforone toggle in the chat.
Q4: What should I do if the minimap button is not appearing?

A: Ensure that the addon is properly installed and enabled. If the issue persists, try reloading the UI with the /reload command.
Q5: How can I report a bug or suggest a feature?

A: You can report bugs or suggest features on the GitHub issues page. Please provide as much detail as possible to help us address your issue or consider your suggestion.
Q6: Is AllforOne compatible with both Retail and Classic versions of World of Warcraft?

A: Yes, AllforOne is designed to be compatible with both Retail and Classic versions of World of Warcraft.
Q7: How do I backup my settings?

A: Your settings are stored in the WTF folder in your World of Warcraft directory. Make a copy of this folder to backup your settings.
Q8: How do I update AllforOne?

A: Download the latest version from CurseForge or GitHub and replace the existing files in your Interface/AddOns directory.
Q9: What classes and specializations are supported by AllforOne?

A: AllforOne supports all classes and specializations, including the new Evoker class.
Q10: How do I reset AllforOne to its default settings?

A: You can reset the addon by deleting the AllforOne settings file in your WTF folder. This will restore the addon to its default state.
