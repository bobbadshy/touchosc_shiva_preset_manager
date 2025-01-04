# "Shiva" Preset Manager

*Shiva Preset Manager* is a sophisticated preset module that can be added to TouchOSC control surfaces.

### Supported features:
- Select controls by tag prefix or all with MIDI msg attached.
- Optionally limit preset to a certain base group, so multiple preset modules can be added to a surface, e.g. one on every pager page.
- Preset name editor.
  - Tap on the multi-line name display to edit the currenttly active preset name.
- Direct access load mode
- Small collapsed mode (tap on heading)
- Extended manager mode (for saving and loading)
- Cut, copy-&-paste, or delete presets between preset slots through context menu.
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

### Usage

- Download and open the preset module `.tosc` file in the TouchOSC editor.
- Copy and paste the control into your surface.
- Go to the "config" group inside the module, and adjust the "Preset root control" setting.
- Enjoy!

### Download

Check the [Releases](https://github.com/bobbadshy/touchosc_shiva_preset_manager/releases) section.

### Bug reports and feature suggestions

Please file an issue in the [Issues](https://github.com/bobbadshy/touchosc_shiva_preset_manager/issues) section.

As this is just a hobby project in my freetime, I cannot promise I will get to any of them, but nevertheless, suggestions and bug reports are welcome! 🙂

### Future features wishlist

- ...?
  
### Screenshots

**Preset manager module in TouchOSC editor view:**

![image](https://github.com/user-attachments/assets/5e8cc508-7f93-416b-bd1f-a345b4ab5523)

**Preset manager module with its (hidden) settings and skin options:**

![image](https://github.com/user-attachments/assets/a3854b87-f970-44bc-b048-d000ad180fd0)

To change settings, open the "settings" group, and edit its value on the right:

![image](https://github.com/user-attachments/assets/1000ed6a-0be0-4f4e-b27d-7a289107bfd7)

**Direct load mode:**

![image](https://github.com/user-attachments/assets/10d927e4-4742-4cc2-ab9e-443e416f5808)

**Copy-and-Paste menu:**

![image](https://github.com/user-attachments/assets/f61e51a8-501d-44d8-a357-fc7817ab14c9)

**Extended mode:**

![image](https://github.com/user-attachments/assets/b0f5bd8f-d94f-4a65-b8ae-cbc3d9021986)

Fail-safe savvng and loading by requiring function select before tapping "ENTER":

![image](https://github.com/user-attachments/assets/01ad1eb3-3e65-4f98-a916-6590f95a1a88)

**Fully collapsed (tap on heading):**

![image](https://github.com/user-attachments/assets/86cb105b-9ddb-4303-9d87-4b2fdbfde95d)

**Fader:**

Select length:

![image](https://github.com/user-attachments/assets/fa5bebf2-22f7-4537-a2d1-9d11fc7cbf9c)


Fader active:

![image](https://github.com/user-attachments/assets/dd4e2095-f94a-4803-bbaa-2f4e35eacf4a)

**Preset name entry:**

![image](https://github.com/user-attachments/assets/2c001d3f-cc80-4003-aa1b-53d62cb1cbe6)
