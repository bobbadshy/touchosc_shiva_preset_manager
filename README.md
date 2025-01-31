# Shiva Preset Manager

*Shiva Preset Manager* is a sophisticated preset module (OSC template) that can be added to your existing [TouchOSC](https://hexler.net/touchosc) control surface to save, load and manage presets of your control settings.

## Contents

- [Shiva Preset Manager](#shiva-preset-manager)
  - [Contents](#contents)
  - [Supported features:](#supported-features)
  - [Demo video](#demo-video)
  - [Screenshots](#screenshots)
  - [Usage](#usage)
    - [Re-using the self-contained on-screen keyboard group for your own surfaces](#re-using-the-self-contained-on-screen-keyboard-group-for-your-own-surfaces)
  - [Download](#download)
  - [Bug reports, Feature Suggestions or Contributing](#bug-reports-feature-suggestions-or-contributing)
  - [Planned features wishlist](#planned-features-wishlist)
  - [Links](#links)
  - [Donations](#donations)

## Supported features:
- Select controls by:
  - MIDI message attached
  - OSC message attached
  - Special string prefixes at start of a control's tag field value: In addition to MIDI or OSC message select mode, controls can always be explicitly included or excluded by adding on of the strings **"shiva"** or **"noshiva"** to the start of any contol's tag! 
- Optionally limit preset to a certain base group, so multiple preset modules can be added to a surface, e.g. one on every pager page.
- Saves the controls' `x`, `y`, and `text` values into the preset.
- ***Interactive settings:*** The above settings can be changed on-the-fly in the running TouchOS surface:
  - Long-tap (hold) the toggle icon on the title bar to open the settings page.
  - When choosing the control select mode in the settings, the number of recognized controls is indicated, and all selected controls are blinked shortly.
- Preset name editor.
  - Tap on the bigger multi-line name display to edit the currently active preset name.
- Direct access load mode
- Small collapsed mode (tap on heading)
- Extended manager mode (for saving and loading):
  - Switch between modes by tapping the toggle icon on the title bar.
- Copy, paste, and delete presets between preset slots through context menu.
  - The context menu is invoked when you long-tap (hold) on:
    - the small selected preset no. display in Extended mode, or
    - any of the preset buttons in Direct access mode.
- Fail-safe load and save
- Automatic and manual preset crossfading
- "Randomize all controls now!" option (available in the interactive settings).
- Last preset is automatically loaded on surface startup.
- Auto-detect and indicate if controls have been modified since last preset loading.
  - Tap on the single-line preset info display to *blink ;)* all controls that currently differ from preset values.
- Restore controls working state cache with 10 undo steps, if you accidently loaded a preset and want to revert to a previous working state.
- A basic skin settings config group in TouchOSC Editor view, to allow quick changes to colors, borders, backgrounds, etc. of elements, and apply those changes at startup.
- ...

## Demo video

A short demonstration is available on YouTube:
- https://youtu.be/AkwHNaYnw2I

Performance test with 200 controls:

- Fast PC, good performance:
  - https://youtu.be/Wb50rBoNh3M?si=iKGUKJHeitzpiVim
- Cheap, 4 year old tablet ..well, it doesn't crash ;)
  - https://www.youtube.com/watch?v=x4XvbOiDYHM 

## Screenshots

- **Extended panel**

  Fail-safe loading and saving requires function select before tapping "ENTER".

![image](./docs/images/extended.png?raw=true)

- **Direct Access panel**

![image](./docs/images/direct.png?raw=true)

- **Fully collapsed** (tap on heading)

![image](./docs/images/collapsed.png?raw=true)

- **Fader**

Selecting a duration.

![image](./docs/images/fader-select.png?raw=true)

- **Fader active**

![image](./docs/images/fader-fading.png?raw=true)

- **Copy-and-Paste menu**

![image](./docs/images/context.png?raw=true)

- **Interactive settings**

  Settings can be changed on-the-fly. \
  *Long-tap (hold) the toggle icon on the title bar to open settings.*

![image](./docs/images/settings.png?raw=true)

- **Preset name entry**

![image](./docs/images/keyboard.png?raw=true)

- **Large keyboard**

  Large keyboard can be selected in interactive settings.

![image](./docs/images/keyboard-large.png?raw=true)

- Preset manager module in TouchOSC editor view:

![image](./docs/images/editor-main.png?raw=true)

- Preset manager module offers some basic skin setting in editor views:

![image](./docs/images/editor-skin.png?raw=true)

- To change colors or borders, open the "skinSettings" group, and edit colors or borders on the right:

![image](./docs/images/editor-skin-edit.png?raw=true)

## Usage

- Download and open the preset module `.tosc` file in the TouchOSC editor.
- Copy and paste the control into your surface.
- Go to the "config" group inside the module, and adjust the "Preset root control" setting.
- Enjoy!

### Re-using the self-contained on-screen keyboard group for your own surfaces

The on-screen keyboard (control group `groupKeyboard`) used in the preset manager is self-contained and re-useable. 
If you want to use it separately in your control surfaces, you can copy just the `groupKeyboard` to anywhere in your surface.

The keyboard control will set itself to visible and interactive upone receiving a notify() message, and hide itself again upon closing.

Short demo video on how to copy and use it in your template:
- https://youtu.be/qeayBo-21eA

<details>

<summary>LUA script for using the keyboard group with arbitrary controls:  (click to expand)</summary>

- From your label or text control, use a lua script to send a `notify()` message to the keyboard group:

  ```
  -- reference to the keyboard control
  local kbd = self.parent.children.groupKeyboard

  function onValueChanged(k)
    -- send on toucch relase
    if k == 'touch' and not self.values.touch then
      -- it sends its own ID and its text value
      kbd:notify(self.ID, self.values.text)
    end
  end

  function onReceiveNotify(cmd, text)
  -- receive the updated text back from keyboard control
    self.values.text = text
  end
  ```
</details>

## Download

Check the [Releases](https://github.com/bobbadshy/touchosc_shiva_preset_manager/releases) section.

## Bug reports, Feature Suggestions or Contributing

*As the version  tags suggest, this is currently a brand new project. The first public release was Jan 2025. So, while it seems to work really well already, please keep in mind that it is **currently in testing and not ready for production**. Thank you!*

Please file an issue in the [Issues](https://github.com/bobbadshy/touchosc_shiva_preset_manager/issues) section.

As this is just a hobby project in my freetime, I cannot promise I will get to any of them, but nevertheless, suggestions and bug reports are welcome! 🙂

If you have any ideas or want to contribute to the project yourself, feel free to fork it and submit the changes back to me.

## Planned features wishlist

- Support send/receive presets over MIDI SysEx, for persistent storage e.g. in a MIDI Librarian, or for ***live sharing over MIDI with other users that use the same OSC template for their gear :).*** See [discussion](https://github.com/bobbadshy/touchosc_shiva_preset_manager/discussions/8) and [MidiHax repo](https://github.com/MidiHax/touchosc-confirm-button) with the code snippets for handling MIDI SysEx encoding/decoding in TouchOSC templates.
- Place the presets table globally, as a sibling to the preset module. This will allow upgrading the preset manager module without losing your presets :)
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


