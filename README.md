# Shiva Preset Manager

*Shiva Preset Manager* is a sophisticated preset module (OSC template) that can be added to your existing [TouchOSC](https://hexler.net/touchosc) control surface to save, load and manage presets of your control settings.

## Contents

- [Shiva Preset Manager](#shiva-preset-manager)
  - [Contents](#contents)
  - [Supported features:](#supported-features)
  - [Demo video](#demo-video)
  - [Screenshots](#screenshots)
  - [Usage](#usage)
  - [Download](#download)
  - [Bug reports, Feature Suggestions or Contributing](#bug-reports-feature-suggestions-or-contributing)
  - [Planned features wishlist](#planned-features-wishlist)
  - [Links](#links)
  - [Donations](#donations)

## Supported features:
- Select controls by:
  - MIDI message attached
  - OSC message attached *(**experimental** ..might need further refinement for the selection process!)*
  - All controls whose tag field starts with the string **"shiva"**
- Regardless of the above mode, controls can always be manually excluded by adding the string **"noshiva"** to the start of the tag field! 
- Optionally limit preset to a certain base group, so multiple preset modules can be added to a surface, e.g. one on every pager page.
- Saves the controls' `x`, `y`, and `text` values into the preset.
- Preset name editor.
  - Tap on the multi-line name display to edit the currently active preset name.
- Direct access load mode
- Small collapsed mode (tap on heading)
- Extended manager mode (for saving and loading)
- Cut, copy and paste, or delete presets between preset slots through context menu.
  - The context menu is invoked when you long-tap (hold) on:
    - the selected preset no. display, or
    - any of the preset buttons in Direct access mode.
- Fail-safe load and save
- Automatic and manual preset crossfading
- Last preset is automatically loaded on surface startup.
- Auto-detect and indicate if controls have been modified since last preset loading.
  - Tap on the single-line preset info display to *blink ;)* all controls that currently differ from preset values.
- Restore controls working state cache with 10 undo steps, if you accidently loaded a preset and want to revert to a previous working state.
- A basic skin settings config to allow quick changes to colors, borders, backgrounds, etc. of elements.
- ...

## Demo video

A short demonstration is available on YouTube:
- https://www.youtube.com/watch?v=QXi5oVgauT8

Performance test with 200 controls:

- Fast PC, good performance:
  - https://youtu.be/Wb50rBoNh3M?si=iKGUKJHeitzpiVim
- Cheap, 4 year old tablet ..well, it doesn't crash ;)
  - https://www.youtube.com/watch?v=x4XvbOiDYHM 

## Screenshots

| Screenhots | |
| ---- | ---- |
|  **Preset manager module in TouchOSC editor view:**  |  ![image](https://github.com/user-attachments/assets/e6ed1e3f-08a0-4ea2-be9d-c8e23caabb12) |
| **Preset manager module with its (hidden) settings and skin options:** | **To change settings, open the "settings" group, and edit its value on the right:** |
| ![image](https://github.com/user-attachments/assets/feba1030-49fa-4441-8203-5d0c948d1401) | ![image](https://github.com/user-attachments/assets/f31e4e80-4a80-48d9-bc7a-b97bc8a73522) |
| **Direct load mode:** | **Copy-and-Paste menu:** |
| ![image](https://github.com/user-attachments/assets/d37e96c9-ce7a-4597-8817-4fdd95cd2e0b) | ![image](https://github.com/user-attachments/assets/92ec8db9-135b-4b23-a27b-52dad95b0c06) | 
| **Extended mode** with fail-safe loading and saving by requiring function select before tapping "ENTER": | **Fully collapsed (tap on heading):** |
| ![image](https://github.com/user-attachments/assets/a908229c-af5a-4d4f-a077-386906a0a5fe) | ![image](https://github.com/user-attachments/assets/86cb105b-9ddb-4303-9d87-4b2fdbfde95d) |
| **Fader**, selecting duration: | **Fader active:* |
| ![image](https://github.com/user-attachments/assets/fa5bebf2-22f7-4537-a2d1-9d11fc7cbf9c) | ![image](https://github.com/user-attachments/assets/dd4e2095-f94a-4803-bbaa-2f4e35eacf4a) |
| **Preset name entry:** |  |
| ![image](https://github.com/user-attachments/assets/cb431ade-b14f-4a39-9889-2c8506e89358) |  |

## Usage

- Download and open the preset module `.tosc` file in the TouchOSC editor.
- Copy and paste the control into your surface.
- Go to the "config" group inside the module, and adjust the "Preset root control" setting.
- Enjoy!

## Download

Check the [Releases](https://github.com/bobbadshy/touchosc_shiva_preset_manager/releases) section.

## Bug reports, Feature Suggestions or Contributing

*As the version  tags suggest, this is currently a brand new project. The first public release was Jan 2025. So, while it seems to work really well already, please keep in mind that it is **currently in testing and not ready for production**. Thank you!*

Please file an issue in the [Issues](https://github.com/bobbadshy/touchosc_shiva_preset_manager/issues) section.

As this is just a hobby project in my freetime, I cannot promise I will get to any of them, but nevertheless, suggestions and bug reports are welcome! 🙂

If you have any ideas or want to contribute to the project yourself, feel free to fork it and submit the changes back to me.

## Planned features wishlist

- Support send/receive presets over MIDI SysEx, for persistent storage e.g. in a MIDI Librarian, or for ***live sharing over MIDI with other users that use the same OSC template for their gear :).*** See [discussion](https://github.com/bobbadshy/touchosc_shiva_preset_manager/discussions/8) and [MidiHax repo](https://github.com/MidiHax/touchosc-confirm-button) with the code snippets for handling MIDI SysEx nToucPSC templates.
- ...no others at the moment, but who knows what tomorrow morning's coffee will bring ;) ...
- ...

## Links

- [Hexler TouchOSC](https://hexler.net/touchosc)
- [TouchOSC Scripting API](https://hexler.net/touchosc/manual/script)

## Donations

This is an Open Source software and free to use for everyone in any which way possible! :)

|    |  PayPal  |
| -- | -------- |
|  If you feel this template made your life a lot easier, and that it is exacly the thing you were looking for, then you can buy me a beer 🍺 (..or beers 🍻..) and I will merrily put out a toast to you for saving yet another evening! 😃<br><br>*(I currently only have a PayPal button, but I may check out getting a Patreon or some "Buy me a coffee" in the future.)* |  [![image](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/donate?hosted_button_id=CGDJVVGG5V8LU&)  |


Many Thanx and Enjoy!


