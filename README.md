# "Shiva" Preset Manager

*Shiva Preset Manager* is a sophisticated preset module that can be added to TouchOSC control surfaces.

### Supported features:
- Select controls by tag prefix or all with MIDI msg attached.
- Optionally limit preset to a certain base group, so multiple preset modules can be added to a surface, e.g. one on every pager page.
- Preset name editor.
  - Tap on the multi-line name display to edit the currenttly active preset name.
- Direct access load mode
- Extended manager mode (for saving and loading)
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

- Hold long-tap on preset button in Direct Access mode opens a context menu that allows cut, copy and paste the preset to another preset position. ;P
- ...?
  
### Screenshots

**Preset manager module in TouchOSC editor view:**

![image](https://github.com/user-attachments/assets/45b2a77f-6f18-4974-a17b-d0ed00175eac)

**Preset manager module with its (hidden) settings and skin options:**

![image](https://github.com/user-attachments/assets/e038f75b-e762-4125-aab5-cf6a5ccd16dc)

To change settings, open the "settings" group, and edit its value on the right:

![image](https://github.com/user-attachments/assets/1000ed6a-0be0-4f4e-b27d-7a289107bfd7)

**Direct load mode:**

![image](https://github.com/user-attachments/assets/4d999af5-5f7c-4e57-853d-a21dd1ddeee1)

**Extended mode:**

![image](https://github.com/user-attachments/assets/3532fbd3-a83e-4c80-9f2e-0265b459f151)

Fail-safe savng and loading by requiring function select before tapping "ENTER":

![image](https://github.com/user-attachments/assets/69cf5947-68a0-4251-859a-c2d13b89f203)

**Fader:**

Select length:

![image](https://github.com/user-attachments/assets/ad3f555f-fae2-40b0-9804-bf69d323fe62)

Fader active:

![image](https://github.com/user-attachments/assets/c0886cd2-5cf1-4b9b-9761-bbf7ce6bec0c)

**Preset name entry:**

![image](https://github.com/user-attachments/assets/c4e254d5-d08f-45a3-a68d-63793c6b64bb)
