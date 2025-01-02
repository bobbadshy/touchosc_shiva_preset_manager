# "Shiva" Preset Manager

*Shiva Preset Manager* is a sophisticated preset module that can be added to TouchOSC control surfaces.

### Supported features:
- Select controls by tag prefix or all with MIDI msg attached
- Optionally limit preset to a certain base group, so multiple preset modules can be added to a surface, e.g. one on every pager page.
- Preset name editor
- Direct access load mode
- Extended manager mode (for saving and loading)
- Fail-safe load and save
- Automatic and manual preset crossfading
- Last preset is automatically loaded on surface startup.
- Auto-detect and indicate if controls have been modified since preset load.
- Restore controls working state cache with 10 undo steps, if you accidently loaded a preset and want to revert to a previous working state.
- ...

### Usage

- Download and open the preset module `.tosc` file in the TouchOSC editor.
- Copy and paste the control into your surface.
- Go to the "config" group inside the module, and adjust the "Preset root control" setting.
- Enjoy!

### Download

Check the [Releases](https://github.com/bobbadshy/touchosc_shiva_preset_manager/releases) section.
