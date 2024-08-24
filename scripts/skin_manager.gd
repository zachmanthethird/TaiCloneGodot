class_name SkinManager

## A collection of user-provided colors, audio and texture files to be used in-game.
##
## [code]iLevel 2[/code]
## @tutorial(osu! Skinning {wiki}): https://osu.ppy.sh/wiki/Skinning/
## @tutorial(osu! Skinning {Source commit}): https://github.com/ppy/osu-wiki/tree/b0afe186b01a363a31211b349e4d83c15033890e/wiki/Skinning
# TODO: Remove all [AnimatedTexture] usages as they are deprecated.
# Blocking question: What do we replace them with that achieves the same functionality?
# TODO: Add .osk support. See [ZIPReader] for more info.
# Blocking question: Should we extract files? If so, where?
# TODO: Add beatmap skinning support.
# Blocking question: How do we default to a user skin rather than the default skin?
# TODO: Add font skinning support.
# Blocking question: How do we turn images into fonts at runtime?
# TODO: Disallow small-note skins.
# Blocking question: How do we even start to achieve this?
# TODO: Ensure skin elements are being used correctly.
# TODO: Rename variables to closer match TaiClone.
# TODO: Reconsider osu!mania-specific mod icons as possible new mods.
# TODO: Add skin.ini functionality.

## The absolute path to the default skin.
const DEFAULT_SKIN_PATH := "res://skins/test_skin"

## The sound that plays when a significant combo is broken.
## [br]([code]Sounds#playfield  combobreak.wav[/code])
var _combo_break: AudioStream

## The sound that plays for a non-finisher kat note.
## [br]([code]Sounds#hitsounds  taiko-normal-hitclap.wav[/code])
var _hit_clap: AudioStream

## The sound that plays for a finisher don note.
## [br]([code]Sounds#hitsounds  taiko-normal-hitfinish.wav[/code])
var _hit_finish: AudioStream

## The sound that plays for a non-finisher don note.
## [br]([code]Sounds#hitsounds  taiko-normal-hitnormal.wav[/code])
var _hit_normal: AudioStream

## The sound that plays for a finisher kat note.
## [br]([code]Sounds#hitsounds  taiko-normal-hitwhistle.wav[/code])
var _hit_whistle: AudioStream

## The color of hit error markers with an accurate score.
var _accurate_color: Color

## The color of barlines.
## @deprecated
var _barline_color: Color

## The color of don notes.
var _don_color: Color

## The color of an early timing indicator or container.
var _early_color: Color

## The color of hit error markers with an inaccurate score.
var _inaccurate_color: Color

## The color of kat notes.
var _kat_color: Color

## The color of a late timing indicator or container.
var _late_color: Color

## The color of hit error markers with a miss score.
var _miss_color: Color

## The color of rolls.
var _roll_color: Color

## The animation of the mascot that plays when hitting a combo milestone.
## [br]([code]osu!taiko#pippidon  pippidonclear.png[/code])
var pippidon_clear: AnimatedTexture

## The animation of the mascot that plays when missing hitobjects or during break time with low health.
## [br]([code]osu!taiko#pippidon  pippidonfail.png[/code])
var pippidon_fail: AnimatedTexture

## The animation of the mascot that plays during normal gameplay.
## [br]([code]osu!taiko#pippidon  pippidonidle.png[/code])
var _pippidon_idle: AnimatedTexture

## The animation of the mascot that plays during kiai time.
## [br]([code]osu!taiko#pippidon  pippidonkiai.png[/code])
var _pippidon_kiai: AnimatedTexture

## The animation of a judgement with a miss score.
## [br]([code]osu!taiko#hit-bursts  taiko-hit0.png[/code])
var _miss_judgement: AnimatedTexture

## The animation of a non-finisher judgement with an inaccurate score.
## [br]([code]osu!taiko#hit-bursts  taiko-hit100.png[/code])
var _inaccurate_judgement: AnimatedTexture

## The animation of a finisher judgement with an inaccurate score.
## [br]([code]osu!taiko#hit-bursts  taiko-hit100k.png[/code])
var _f_inaccurate_judgement: AnimatedTexture

## The animation of a non-finisher judgement with an accurate score.
## [br]([code]osu!taiko#hit-bursts  taiko-hit300.png[/code])
var _accurate_judgement: AnimatedTexture

## The animation of a finisher judgement with an accurate score.
## [br]([code]osu!taiko#hit-bursts  taiko-hit300k.png[/code])
var _f_accurate_judgement: AnimatedTexture

## The texture of a finisher judgement with an accurate score. Only used on the results screen.
## [br]([code]osu!taiko#hit-bursts  taiko-hit300g.png[/code])
var _f_accurate_results: Texture2D

## The texture of a finisher note. Colored based on the note type.
## [br]([code]osu!taiko#notes  taikobigcircle.png[/code])
var _big_circle: Texture2D

## The animation on top of a finisher note.
## [br]([code]osu!taiko#notes  taikobigcircleoverlay.png[/code])
var _big_circle_overlay: AnimatedTexture

## The texture of a non-finisher note. Colored based on the note type.
## [br]([code]osu!taiko#notes  taikohitcircle.png[/code])
var _hit_circle: Texture2D

## The animation on top of a non-finisher note.
## [br]([code]osu!taiko#notes  taikohitcircleoverlay.png[/code])
var _hit_circle_overlay: AnimatedTexture

## The texture of the border of the hit position.
## [br]([code]osu!taiko#notes  approachcircle.png[/code])
var _approach_circle: Texture2D

## The texture of the glow of the hit position during kiai time. Expands when notes are hit.
## [br]([code]osu!taiko#notes  taiko-glow.png[/code])
var _kiai_glow_texture: Texture2D

## The texture that pulsates behind the hit position during kiai time.
## [br]([code]osu!taiko#notes  lighting.png[/code])
var lighting_texture: Texture2D

## The texture on top of the playfield that scrolls towards the left during normal gameplay.
## Disabled if a storyboard is present.
## [br]([code]osu!taiko#playfield-(upper-half)  taiko-slider.png[/code])
var slider_pass: Texture2D

## The texture on top of the playfield that scrolls towards the left when missing hitobjects or during break time with low health.
## Disabled if a storyboard is present.
## [br]([code]osu!taiko#playfield-(upper-half)  taiko-slider-fail.png[/code])
var slider_fail: Texture2D

## The textures of combo bursts that appear behind the mascot when hitting a combo milestone.
## Only one texture is displayed at random at each milestone.
## [br]([code]osu!taiko#playfield-(upper-half)  taiko-flower-group.png[/code])
var flower_group: AnimatedTexture

## The texture of the background of the input drum.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-bar-left.png[/code])
var _bar_left_texture: Texture2D

## The texture of the don portion of the input drum.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-drum-inner.png[/code])
var _don_texture: Texture2D

## The texture of the kat portion of the input drum.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-drum-outer.png[/code])
var _kat_texture: Texture2D

## The texture of the playfield during normal gameplay.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-bar-right.png[/code])
var _bar_right_texture: Texture2D

## The texture of the playfield during kiai time.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-bar-right-glow.png[/code])
var _bar_right_glow: Texture2D

## The texture of a barline.
## [br]([code]osu!taiko#playfield-(lower-half)  taiko-barline.png[/code])
var barline_texture: Texture2D

## The texture of the body of a roll.
## [br]([code]osu!taiko#drumrolls  taiko-roll-middle.png[/code])
var _roll_middle: Texture2D

## The texture of the end of a roll.
## [br]([code]osu!taiko#drumrolls  taiko-roll-end.png[/code])
var _roll_end: Texture2D

## The texture of a tick.
## [br]([code]osu!taiko#drumrolls  sliderscorepoint.png[/code])
var _tick_texture: Texture2D

## The texture of a spinner warning.
## [br]([code]osu!taiko#shaker  spinner-warning.png[/code])
var _spinner_warning: Texture2D

## The texture of a spinner that rotates when hit.
## [br]([code]osu!taiko#shaker  spinner-circle.png[/code])
var _spinner_circle: Texture2D

## The texture on a spinner that shrinks to indicate duration.
## [br]([code]osu!taiko#shaker  spinner-approachcircle.png[/code])
var _spinner_approach: Texture2D

## The texture of the background of the game when not using another source.
## [br]([code]Interface#main-menu  menu-background.jpg[/code])
var _menu_bg: Texture2D

## The texture that appears before the main menu when launching the game.
## [br]([code]Interface#main-menu  welcome_text.png[/code])
var welcome_text: Texture2D

## The texture of particles that optionally fall on the main menu.
## [br]([code]Interface#main-menu  menu-snow.png[/code])
var menu_snow: Texture2D

# TODO: Are these button textures viable to be used? Do we even want to use them?
# See [TextureButton] and [NinePatchRect] for possible implementations.
## The texture of the left portion of a generic button.
## [br]([code]Interface#button  button-left.png[/code])
var button_left: Texture2D

## The texture of the middle portion of a generic button.
## [br]([code]Interface#button  button-middle.png[/code])
var button_middle: Texture2D

## The texture of the right portion of a generic button.
## [br]([code]Interface#button  button-right.png[/code])
var button_right: Texture2D

# TODO: What's the best way to add cursor skinning support with multiple overlapping textures?
# https://docs.godotengine.org/en/4.2/tutorials/inputs/custom_mouse_cursor.html#using-a-script
## The texture of the cursor that rotates and expands when a click occurs.
## [br]([code]Interface#cursor  cursor.png[/code])
var cursor_texture: Texture2D

## The texture of the cursor with no extra movement.
## [br]([code]Interface#cursor  cursormiddle.png[/code])
var cursor_middle: Texture2D

## The texture of the trail of the cursor when pressing the smoke key.
## [br]([code]Interface#cursor  cursor-smoke.png[/code])
var cursor_smoke: Texture2D

## The texture of the trail of the cursor.
## [br]([code]Interface#cursor  cursortrail.png[/code])
var cursor_trail: Texture2D

## The texture that appears where a click occurs.
## [br]([code]Interface#cursor  cursor-ripple.png[/code])
var cursor_ripple: Texture2D

## The texture of the Autoplay mod icon.
## [br]([code]Interface#mod-icons  selection-mod-autoplay.png[/code])
var mod_auto: Texture2D

## The texture of the Cinema mod icon.
## [br]([code]Interface#mod-icons  selection-mod-cinema.png[/code])
var mod_cinema: Texture2D

## The texture of the Double Time mod icon.
## [br]([code]Interface#mod-icons  selection-mod-doubletime.png[/code])
var mod_double_time: Texture2D

## The texture of the Easy mod icon.
## [br]([code]Interface#mod-icons  selection-mod-easy.png[/code])
var mod_easy: Texture2D

## The texture of the Flashlight mod icon.
## [br]([code]Interface#mod-icons  selection-mod-flashlight.png[/code])
var mod_flashlight: Texture2D

## The texture of the Half Time mod icon.
## [br]([code]Interface#mod-icons  selection-mod-halftime.png[/code])
var mod_half_time: Texture2D

## The texture of the Hard Rock mod icon.
## [br]([code]Interface#mod-icons  selection-mod-hardrock.png[/code])
var mod_hard_rock: Texture2D

## The texture of the Hidden mod icon.
## [br]([code]Interface#mod-icons  selection-mod-hidden.png[/code])
var mod_hidden: Texture2D

## The texture of the Nightcore mod icon.
## [br]([code]Interface#mod-icons  selection-mod-nightcore.png[/code])
var mod_nightcore: Texture2D

## The texture of the No Fail mod icon.
## [br]([code]Interface#mod-icons  selection-mod-nofail.png[/code])
var mod_no_fail: Texture2D

## The texture of the Perfect mod icon.
## [br]([code]Interface#mod-icons  selection-mod-perfect.png[/code])
var mod_perfect: Texture2D

## The texture of the Relax mod icon.
## [br]([code]Interface#mod-icons  selection-mod-relax.png[/code])
var mod_relax: Texture2D

## The texture of the ScoreV2 mod icon.
## [br]([code]Interface#mod-icons  selection-mod-scorev2.png[/code])
var mod_score: Texture2D

## The texture of the Sudden Death mod icon.
## [br]([code]Interface#mod-icons  selection-mod-suddendeath.png[/code])
var mod_sudden_death: Texture2D

## The texture that indicates whether optional mods were allowed during a replay.
## [br]([code]Interface#mod-icons  selection-mod-freemodallowed.png[/code])
var mod_free: Texture2D

## The texture that indicates whether a touchscreen was used during a replay.
## [br]([code]Interface#mod-icons  selection-mod-touchdevice.png[/code])
var mod_touch_device: Texture2D

## The texture used in the offset adjustment screen.
## [br]([code]Interface#offset-wizard  options-offset-tick.png[/code])
var offset_tick: Texture2D

## The animation that skips the intro when clicked during gameplay.
## [br]([code]Interface#playfield  play-skip.png[/code])
var play_skip: AnimatedTexture

## The texture displayed if a replay uses mods that disable score submission.
## [br]([code]Interface#playfield  play-unranked.png[/code])
var play_unranked: Texture2D

## The texture of a generic arrow. Colored based on where it is used.
## Superseded by [member arrow_pause] and [member arrow_warning].
## [br]([code]Interface#playfield  play-warningarrow.png[/code])
var warning_arrow: Texture2D

## The texture of an arrow used on the pause and fail screens.
## Supersedes [member warning_arrow].
## [br]([code]Interface#playfield  arrow-pause.png[/code])
var arrow_pause: Texture2D

## The texture of an arrow used at the end of break sections.
## Supersedes [member warning_arrow].
## [br]([code]Interface#playfield  arrow-warning.png[/code])
var arrow_warning: Texture2D

## The texture used to cover the playfield when using the Hidden mod.
## [br]([code]Interface#playfield  masking-border.png[/code])
var masking_border: Texture2D

## The texture displayed when a user has skipped the intro in multiplayer.
## [br]([code]Interface#playfield  multi-skipped.png[/code])
var multi_skipped: Texture2D

## The texture displayed during break time with low health.
## [br]([code]Interface#playfield  section-fail.png[/code])
var section_fail: Texture2D

## The texture displayed during break time without low health.
## [br]([code]Interface#playfield  section-pass.png[/code])
var section_pass: Texture2D

## The texture of the last number of the countdown.
## [br]([code]Interface#countdown  count1.png[/code])
var count_one: Texture2D

## The texture of the second number of the countdown.
## [br]([code]Interface#countdown  count2.png[/code])
var count_two: Texture2D

## The texture of the first number of the countdown.
## [br]([code]Interface#countdown  count3.png[/code])
var count_three: Texture2D

## The texture displayed after the countdown.
## [br]([code]Interface#countdown  go.png[/code])
var count_go: Texture2D

## The texture displayed before the countdown.
## [br]([code]Interface#countdown  ready.png[/code])
var count_ready: Texture2D

## The texture of the background of the input overlay.
## [br]([code]Interface#input-overlay  inputoverlay-background.png[/code])
var input_background: Texture2D

## The texture for each key on the input overlay. Colored based on inputs.
## [br]([code]Interface#input-overlay  inputoverlay-key.png[/code])
var input_key: Texture2D

## The texture of the background of the pause screen.
## [br]([code]Interface#pause-screen  pause-overlay.png[/code])
var pause_overlay: Texture2D

## The texture of the background of the fail screen.
## [br]([code]Interface#pause-screen  fail-background.png[/code])
var fail_background: Texture2D

## The texture of the back button on the pause and fail screens.
## [br]([code]Interface#pause-screen  pause-back.png[/code])
var pause_back: Texture2D

## The texture of the continue button on the pause screen.
## [br]([code]Interface#pause-screen  pause-continue.png[/code])
var pause_continue: Texture2D

## The texture of the replay button on the results screen.
## Superseded by [member ranking_replay].
## [br]([code]Interface#pause-screen  pause-replay.png[/code])
## @deprecated
var pause_replay: Texture2D

## The texture of the retry button on the pause, fail, and results screens.
## Superseded by [member ranking_retry] only on the results screen.
## [br]([code]Interface#pause-screen  pause-retry.png[/code])
var pause_retry: Texture2D

## The texture of the background of the health bar.
## [br]([code]Interface#scorebar  scorebar-bg.png[/code])
var health_bg: Texture2D

## The animation that fills up the health bar. Colored based on fill amount.
## Only animated when the health bar is full.
## [br]([code]Interface#scorebar  scorebar-colour.png[/code])
var health_texture: AnimatedTexture

## The texture of the indicator of the health bar in the "passing" zone.
## Superseded by [member health_marker].
## [br]([code]Interface#scorebar  scorebar-ki.png[/code])
var health_ki: Texture2D

## The texture of the indicator of the health bar in the "warning" zone.
## Superseded by [member health_marker].
## [br]([code]Interface#scorebar  scorebar-kidanger.png[/code])
var health_danger: Texture2D

## The texture of the indicator of the health bar in the "critical" zone.
## Superseded by [member health_marker].
## [br]([code]Interface#scorebar  scorebar-kidanger2.png[/code])
var health_danger_two: Texture2D

## The texture of the indicator of the health bar.
## Supersedes [member health_danger], [member health_danger_two], and [member health_ki].
## [br]([code]Interface#scorebar  scorebar-marker.png[/code])
var health_marker: Texture2D

## The textures of the numbers 0 to 9 used for the score, accuracy and combo displays.
## [br]([code]Interface#score-numbers  score-{n}.png[/code])
var score_texture: AnimatedTexture

## The texture of a decimal comma used for the accuracy display.
## [br]([code]Interface#score-numbers  score-comma.png[/code])
var score_comma: Texture2D

## The texture of a decimal point used for the accuracy display.
## [br]([code]Interface#score-numbers  score-dot.png[/code])
var score_dot: Texture2D

## The texture of a percent sign used for the accuracy display.
## [br]([code]Interface#score-numbers  score-percent.png[/code])
var score_percent: Texture2D

## The texture of a Silver SS rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-XH.png[/code])
var ranking_xh: Texture2D

## The texture of a Silver SS rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-XH-small.png[/code])
var ranking_xh_small: Texture2D

## The texture of an SS rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-X.png[/code])
var ranking_x: Texture2D

## The texture of an SS rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-X-small.png[/code])
var ranking_x_small: Texture2D

## The texture of a Silver S rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-SH.png[/code])
var ranking_sh: Texture2D

## The texture of a Silver S rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-SH-small.png[/code])
var ranking_sh_small: Texture2D

## The texture of an S rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-S.png[/code])
var ranking_s: Texture2D

## The texture of an S rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-S-small.png[/code])
var ranking_s_small: Texture2D

## The texture of an A rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-A.png[/code])
var ranking_a: Texture2D

## The texture of an A rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-A-small.png[/code])
var ranking_a_small: Texture2D

## The texture of a B rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-B.png[/code])
var ranking_b: Texture2D

## The texture of a B rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-B-small.png[/code])
var ranking_b_small: Texture2D

## The texture of a C rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-C.png[/code])
var ranking_c: Texture2D

## The texture of a C rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-C-small.png[/code])
var ranking_c_small: Texture2D

## The texture of a D rank used on the results screen.
## [br]([code]Interface#ranking-grades  ranking-D.png[/code])
var ranking_d: Texture2D

## The texture of a D rank used during gameplay and on the song select screen.
## [br]([code]Interface#ranking-grades  ranking-D-small.png[/code])
var ranking_d_small: Texture2D

## The texture that says "Accuracy" on the results screen.
## [br]([code]Interface#ranking-screen  ranking-accuracy.png[/code])
var ranking_accuracy: Texture2D

## The texture of the background of the graph on the results screen.
## [br]([code]Interface#ranking-screen  ranking-graph.png[/code])
var ranking_graph: Texture2D

## The texture that says "Combo" on the results screen.
## [br]([code]Interface#ranking-screen  ranking-maxcombo.png[/code])
var ranking_combo: Texture2D

## The texture of the background of the main portion of the results screen.
## [br]([code]Interface#ranking-screen  ranking-panel.png[/code])
var ranking_panel: Texture2D

## The texture that says "Perfect" on the results screen.
## [br]([code]Interface#ranking-screen  ranking-perfect.png[/code])
var ranking_perfect: Texture2D

## The texture that says "Ranking" on the results screen.
## [br]([code]Interface#ranking-screen  ranking-title.png[/code])
var ranking_title: Texture2D

## The texture of the replay button on the results screen.
## Supersedes [member pause_replay].
## [br]([code]Interface#ranking-screen  ranking-replay.png[/code])
var ranking_replay: Texture2D

## The texture of the retry button on the results screen.
## Supersedes [member pause_retry] only on the results screen.
## [br]([code]Interface#ranking-screen  ranking-retry.png[/code])
var ranking_retry: Texture2D

## The texture of the background for the winner on the results screen.
## [br]([code]Interface#ranking-screen  ranking-winner.png[/code])
var ranking_winner: Texture2D

## The textures of the numbers 0 to 9 used on the input overlay and leaderboard during gameplay.
## Colored based on where it is used.
## [br]([code]Interface#score-entry  scoreentry-{n}.png[/code])
var entry_texture: AnimatedTexture

## The texture of a decimal comma used on the leaderboard during gameplay.
## Colored based on where it is used.
## [br]([code]Interface#score-entry  scoreentry-comma.png[/code])
var entry_comma: Texture2D

## The texture of a decimal point used on the leaderboard during gameplay.
## Colored based on where it is used.
## [br]([code]Interface#score-entry  scoreentry-dot.png[/code])
var entry_dot: Texture2D

## The texture of a percent sign used on the leaderboard during gameplay.
## Colored based on where it is used.
## [br]([code]Interface#score-entry  scoreentry-percent.png[/code])
var entry_percent: Texture2D

## The texture of a combo suffix used on the leaderboard during gameplay.
## Colored based on where it is used.
## [br]([code]Interface#score-entry  scoreentry-x.png[/code])
var entry_x: Texture2D

## The animation of the back button.
## [br]([code]Interface#song-selection  menu-back.png[/code])
var menu_back: AnimatedTexture

## The texture of the background of a song button.
## [br]([code]Interface#song-selection  menu-button-background.png[/code])
var selection_background: Texture2D

## The texture of an icon representing a forum.
## [br]([code]Interface#song-selection  rank-forum.png[/code])
var forum_texture: Texture2D

## The texture of the mode selection button.
## [br]([code]Interface#song-selection  selection-mode.png[/code])
var selection_mode: Texture2D

## The texture of the mode selection button when hovered.
## [br]([code]Interface#song-selection  selection-mode-over.png[/code])
var selection_mode_over: Texture2D

## The texture of the mods menu button.
## [br]([code]Interface#song-selection  selection-mods.png[/code])
var selection_mods: Texture2D

## The texture of the mods menu button when hovered.
## [br]([code]Interface#song-selection  selection-mods-over.png[/code])
var selection_mods_over: Texture2D

## The texture of the random button.
## [br]([code]Interface#song-selection  selection-random.png[/code])
var selection_random: Texture2D

## The texture of the random button when hovered.
## [br]([code]Interface#song-selection  selection-random-over.png[/code])
var selection_random_over: Texture2D

## The texture of the options button.
## [br]([code]Interface#song-selection  selection-options.png[/code])
var selection_options: Texture2D

## The texture of the options button when hovered.
## [br]([code]Interface#song-selection  selection-options-over.png[/code])
var selection_options_over: Texture2D

## The texture of grouping tab buttons.
## [br]([code]Interface#song-selection  selection-tab.png[/code])
var selection_tab: Texture2D

## The texture of the bottom of the song select screen.
## [br]([code]Interface#song-selection  songselect-bottom.png[/code])
var song_select_bottom: Texture2D

## The texture of the top of the song select screen.
## [br]([code]Interface#song-selection  songselect-top.png[/code])
var song_select_top: Texture2D

## The texture of a star used to show difficulty on the song select screen.
## [br]([code]Interface#song-selection  star.png[/code])
var star: Texture2D

## The texture of star-shaped particles.
## [br]([code]Interface#song-selection  star2.png[/code])
var star_two: Texture2D

## The texture of the taiko icon used on the song select screen.
## [br]([code]Interface#mode-select  mode-taiko.png[/code])
var mode_texture: Texture2D

## The texture of the taiko icon used in the mode selection menu.
## [br]([code]Interface#mode-select  mode-taiko-med.png[/code])
var mode_med: Texture2D

## The texture of the taiko icon used on the main menu and song select screens.
## [br]([code]Interface#mode-select  mode-taiko-small.png[/code])
var mode_small: Texture2D

# ZMTT TODO: Sounds skinning


## See [method Object._init].
## [br][param skin_path] The absolute path to the skin folder.
## [codeblock]
## "base_file_name":
##     audio_variable = _get_audio(cur_files, key, skin_path, ["default_skin_file_extension"])
##     texture_animation = _get_texture(cur_files, key, skin_path, crop_out_transparent_edges, "animation_prefix", ["default_skin_file_extension"], maximum_animation_frames)
##     texture_variable = _get_texture(cur_files, key, skin_path, crop_out_transparent_edges, "-", ["default_skin_file_extension"]).get_frame_texture(0)
## [/codeblock]
## @experimental
func _init(skin_path: String) -> void:
	#_accurate_color = Color("52a6ff")
	#_barline_color = Color.WHITE
	#_don_color = Color("eb452c")
	#_early_color = Color("ff5a5a")
	#_inaccurate_color = Color("79da5e")
	#_kat_color = Color("448dab")
	#_late_color = Color("5a5aff")
	#_miss_color = Color("c74b4b")
	#_roll_color = Color("fc5306")
	# ZMTT TODO: Do this step later as to not "unpack" the array.
	var files: Array[String] = []
	for file_name in DirAccess.get_files_at(skin_path):
		if file_name.get_extension() != "import":
			# ZMTT TODO: This almost works except for [member welcome_text].
			files.append(file_name.replace("-", "_"))

	# TODO: Animations longer than 10 frames cannot be sorted this way.
	files.sort()
	# ZMTT TODO: Looking up by key twice is not a good idea.
	# However, this function needs some serious rewriting to achieve that.
	for key in PackedStringArray(["approachcircle", "arrow_pause", "arrow_warning", "button_left", "button_middle", "button_right", "combobreak", "count1", "count2", "count3", "cursor", "cursor_ripple", "cursor_smoke", "cursormiddle", "cursortrail", "fail_background", "go", "inputoverlay_background", "inputoverlay_key", "lighting", "masking_border", "menu_back", "menu_background", "menu_button_background", "menu_snow", "mode_taiko", "mode_taiko_med", "mode_taiko_small", "multi_skipped", "options_offset_tick", "pause_back", "pause_continue", "pause_overlay", "pause_replay", "pause_retry", "pippidonclear", "pippidonfail", "pippidonidle", "pippidonkiai", "play_skip", "play_unranked", "play_warningarrow", "rank_forum", "ranking_A", "ranking_A_small", "ranking_B", "ranking_B_small", "ranking_C", "ranking_C_small", "ranking_D", "ranking_D_small", "ranking_S", "ranking_SH", "ranking_SH_small", "ranking_S_small", "ranking_X", "ranking_XH", "ranking_XH_small", "ranking_X_small", "ranking_accuracy", "ranking_graph", "ranking_maxcombo", "ranking_panel", "ranking_perfect", "ranking_replay", "ranking_retry", "ranking_title", "ranking_winner", "ready", "score", "score_comma", "score_dot", "score_percent", "scorebar_bg", "scorebar_colour", "scorebar_ki", "scorebar_kidanger", "scorebar_kidanger2", "scorebar_marker", "scoreentry", "scoreentry_comma", "scoreentry_dot", "scoreentry_percent", "scoreentry_x", "section_fail", "section_pass", "selection_mod_autoplay", "selection_mod_cinema", "selection_mod_doubletime", "selection_mod_easy", "selection_mod_flashlight", "selection_mod_freemodallowed", "selection_mod_halftime", "selection_mod_hardrock", "selection_mod_hidden", "selection_mod_nightcore", "selection_mod_nofail", "selection_mod_perfect", "selection_mod_relax", "selection_mod_scorev2", "selection_mod_suddendeath", "selection_mod_touchdevice", "selection_mode", "selection_mode_over", "selection_mods", "selection_mods_over", "selection_options", "selection_options_over", "selection_random", "selection_random_over", "selection_tab", "sliderscorepoint", "songselect_bottom", "songselect_top", "spinner_approachcircle", "spinner_circle", "spinner_warning", "star", "star2", "taiko_bar_left", "taiko_bar_right", "taiko_bar_right_glow", "taiko_barline", "taiko_drum_inner", "taiko_drum_outer", "taiko_flower_group", "taiko_glow", "taiko_hit0", "taiko_hit100", "taiko_hit100k", "taiko_hit300", "taiko_hit300g", "taiko_hit300k", "taiko_normal_hitclap", "taiko_normal_hitfinish", "taiko_normal_hitnormal", "taiko_normal_hitwhistle", "taiko_roll_end", "taiko_roll_middle", "taiko_slider", "taiko_slider_fail", "taikobigcircle", "taikobigcircleoverlay", "taikohitcircle", "taikohitcircleoverlay", "welcome_text"]):
		var cur_files: Array[String] = []
		while true:
			if files.is_empty():
				break

			var file_name := files[0].trim_prefix(key)
			var extension := file_name.get_basename().trim_suffix("@2x").replace("_", "-")
			if extension.is_valid_int() or extension.is_empty():
				cur_files.append(file_name)

			# TODO: This relies on having files for every key, which is not always the case.
			elif not cur_files.is_empty() or file_name > key:
				break

			files.remove_at(0)

		#match key:
			#"approachcircle":
			#	_approach_circle = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"arrow_pause":
			#	arrow_pause = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"arrow_warning":
			#	arrow_warning = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"button_left":
			#	button_left = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"button_middle":
			#	button_middle = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"button_right":
			#	button_right = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"combobreak":
			#	_combo_break = _get_audio(cur_files, key, skin_path)

			#"count1":
			#	count_one = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"count2":
			#	count_two = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"count3":
			#	count_three = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"cursor":
			#	cursor_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"cursor_ripple":
			#	cursor_ripple = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"cursor_smoke":
			#	cursor_smoke = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"cursormiddle":
			#	cursor_middle = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"cursortrail":
			#	cursor_trail = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"fail_background":
			#	fail_background = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"go":
			#	count_go = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"inputoverlay_background":
			#	input_background = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"inputoverlay_key":
			#	input_key = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"lighting":
			#	lighting_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"masking_border":
			#	masking_border = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"menu_back":
			#	menu_back = _get_texture(cur_files, key, skin_path, "_")

			#"menu_background":
			#	_menu_bg = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"menu_button_background":
			#	selection_background = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"menu_snow":
			#	menu_snow = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"mode_taiko":
			#	mode_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"mode_taiko_med":
			#	mode_med = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"mode_taiko_small":
			#	mode_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"multi_skipped":
			#	multi_skipped = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"options_offset_tick":
			#	offset_tick = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pause_back":
			#	pause_back = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pause_continue":
			#	pause_continue = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pause_overlay":
			#	pause_overlay = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pause_replay":
			#	pause_replay = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pause_retry":
			#	pause_retry = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"pippidonclear":
			#	pippidon_clear = _get_texture(cur_files, key, skin_path, "", false, [], 7)
			#	# TODO: Special animation

			#"pippidonfail":
			#	pippidon_fail = _get_texture(cur_files, key, skin_path, "", false, [])

			#"pippidonidle":
			#	_pippidon_idle = _get_texture(cur_files, key, skin_path, "", false, ["0.png", "1.png"])
			#	_pippidon_idle.pause = true

			#"pippidonkiai":
			#	_pippidon_kiai = _get_texture(cur_files, key, skin_path, "", false, ["0.png", "1.png"])
			#	_pippidon_kiai.pause = true

			#"play_skip":
			#	play_skip = _get_texture(cur_files, key, skin_path, "_")

			#"play_unranked":
			#	play_unranked = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"play_warningarrow":
			#	warning_arrow = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"rank_forum":
			#	forum_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_A":
			#	ranking_a = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_A_small":
			#	ranking_a_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_B":
			#	ranking_b = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_B_small":
			#	ranking_b_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_C":
			#	ranking_c = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_C_small":
			#	ranking_c_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_D":
			#	ranking_d = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_D_small":
			#	ranking_d_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_S":
			#	ranking_s = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_SH":
			#	ranking_sh = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_SH_small":
			#	ranking_sh_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_S_small":
			#	ranking_s_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_X":
			#	ranking_x = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_XH":
			#	ranking_xh = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_XH_small":
			#	ranking_xh_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_X_small":
			#	ranking_x_small = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_accuracy":
			#	ranking_accuracy = _get_texture(cur_files, key, skin_path, "_").get_frame_texture(0)

			#"ranking_graph":
			#	ranking_graph = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_maxcombo":
			#	ranking_combo = _get_texture(cur_files, key, skin_path, "_").get_frame_texture(0)

			#"ranking_panel":
			#	ranking_panel = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_perfect":
			#	ranking_perfect = _get_texture(cur_files, key, skin_path, "_").get_frame_texture(0)

			#"ranking_replay":
			#	ranking_replay = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_retry":
			#	ranking_retry = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_title":
			#	ranking_title = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ranking_winner":
			#	ranking_winner = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"ready":
			#	count_ready = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"score":
			#	score_texture = _get_texture(cur_files, key, skin_path, "_", true, [], 10)

			#"score_comma":
			#	score_comma = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"score_dot":
			#	score_dot = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"score_percent":
			#	score_percent = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scorebar_bg":
			#	health_bg = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scorebar_colour":
			#	health_texture = _get_texture(cur_files, key, skin_path, "_")

			#"scorebar_ki":
			#	health_ki = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scorebar_kidanger":
			#	health_danger = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scorebar_kidanger2":
			#	health_danger_two = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scorebar_marker":
			#	health_marker = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scoreentry":
			#	entry_texture = _get_texture(cur_files, key, skin_path, "_", true, [], 10)

			#"scoreentry_comma":
			#	entry_comma = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scoreentry_dot":
			#	entry_dot = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scoreentry_percent":
			#	entry_percent = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"scoreentry_x":
			#	entry_x = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"section_fail":
			#	section_fail = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"section_pass":
			#	section_pass = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_autoplay":
			#	mod_auto = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_cinema":
			#	mod_cinema = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_doubletime":
			#	mod_double_time = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_easy":
			#	mod_easy = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_flashlight":
			#	mod_flashlight = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_freemodallowed":
			#	mod_free = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_halftime":
			#	mod_half_time = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_hardrock":
			#	mod_hard_rock = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_hidden":
			#	mod_hidden = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_nightcore":
			#	mod_nightcore = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_nofail":
			#	mod_no_fail = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_perfect":
			#	mod_perfect = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_relax":
			#	mod_relax = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_scorev2":
			#	mod_score = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_suddendeath":
			#	mod_sudden_death = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mod_touchdevice":
			#	mod_touch_device = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mode":
			#	selection_mode = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mode_over":
			#	selection_mode_over = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mods":
			#	selection_mods = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_mods_over":
			#	selection_mods_over = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_options":
			#	selection_options = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_options_over":
			#	selection_options_over = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_random":
			#	selection_random = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_random_over":
			#	selection_random_over = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"selection_tab":
			#	selection_tab = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"sliderscorepoint":
			#	_tick_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"songselect_bottom":
			#	song_select_bottom = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"songselect_top":
			#	song_select_top = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"spinner_approachcircle":
			#	_spinner_approach = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"spinner_circle":
			#	_spinner_circle = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"spinner_warning":
			#	_spinner_warning = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"star":
			#	star = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"star2":
			#	star_two = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_bar_left":
			#	_bar_left_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_bar_right":
			#	_bar_right_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_bar_right_glow":
			#	if cur_files.is_empty():
			#		_bar_right_glow = _bar_right_texture

			#	# TODO: If this fails, it doesn't fallback correctly.
			#	else:
			#		_bar_right_glow = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_barline":
			#	barline_texture = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_drum_inner":
			#	_don_texture = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"taiko_drum_outer":
			#	_kat_texture = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"taiko_flower_group":
			#	flower_group = _get_texture(cur_files, key, skin_path, "_")

			#"taiko_glow":
			#	_kiai_glow_texture = _get_texture(cur_files, key, skin_path, "-", false).get_frame_texture(0)

			#"taiko_hit0":
			#	_miss_judgement = _get_texture(cur_files, key, skin_path, "_", false)
			#	_miss_judgement.one_shot = true

			#"taiko_hit100":
			#	_inaccurate_judgement = _get_texture(cur_files, key, skin_path, "_", false)
			#	_inaccurate_judgement.one_shot = true

			#"taiko_hit100k":
			#	_f_inaccurate_judgement = _get_texture(cur_files, key, skin_path, "_", false)
			#	_f_inaccurate_judgement.one_shot = true

			#"taiko_hit300":
			#	_accurate_judgement = _get_texture(cur_files, key, skin_path, "_", false)
			#	_accurate_judgement.one_shot = true

			#"taiko_hit300g":
			#	# TODO: None of this fallback logic is correct.
			#	if cur_files.is_empty():
			#		_f_accurate_results = _accurate_judgement.get_frame_texture(0)

			#	else:
			#		_f_accurate_results = _get_texture(cur_files, key, skin_path, "_", false).get_frame_texture(0)

			#"taiko_hit300k":
			#	_f_accurate_judgement = _get_texture(cur_files, key, skin_path, "_", false)
			#	_f_accurate_judgement.one_shot = true

			#"taiko_normal_hitclap":
			#	_hit_clap = _get_audio(cur_files, key, skin_path)

			#"taiko_normal_hitfinish":
			#	_hit_finish = _get_audio(cur_files, key, skin_path)

			#"taiko_normal_hitnormal":
			#	_hit_normal = _get_audio(cur_files, key, skin_path)

			#"taiko_normal_hitwhistle":
			#	_hit_whistle = _get_audio(cur_files, key, skin_path)

			#"taiko_roll_end":
			#	_roll_end = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_roll_middle":
			#	_roll_middle = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_slider":
			#	slider_pass = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taiko_slider_fail":
			#	slider_fail = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taikobigcircle":
			#	_big_circle = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taikobigcircleoverlay":
			#	_big_circle_overlay = _get_texture(cur_files, key, skin_path, "_", true, ["_0.png"], 2)
			#	_big_circle_overlay.pause = true

			#"taikohitcircle":
			#	_hit_circle = _get_texture(cur_files, key, skin_path).get_frame_texture(0)

			#"taikohitcircleoverlay":
			#	_hit_circle_overlay = _get_texture(cur_files, key, skin_path, "_", true, ["_0.png"], 2)
			#	_hit_circle_overlay.pause = true

			#"welcome_text":
			#	welcome_text = _get_texture(cur_files, key, skin_path).get_frame_texture(0)


## Retrieves an audio file.
## [br][param cur_files] The list of file suffixes to retrieve.
## [br][param key] The base file name currently being retrieved.
## [br][param skin_path] The absolute path to the skin folder.
## [br][param default_files] The list of file suffixes in the [constant DEFAULT_SKIN_PATH].
## [br][param return] The playable stream of the audio file.
func _get_audio(cur_files: Array[String], key: String, skin_path: String, default_files: Array[String] = [".wav"]) -> AudioStream:
	if cur_files.is_empty():
		skin_path = DEFAULT_SKIN_PATH
		cur_files = default_files

	return AudioLoader.load_file(skin_path.path_join((key + cur_files[0]).replace("_", "-")))


## Retrieves textures from image files.
## [br][param cur_files] The list of file suffixes to retrieve.
## [br][param key] The base file name currently being retrieved.
## [br][param skin_path] The absolute path to the skin folder.
## [br][param animation_prefix] The delimiter before the animation frame number in the file suffix.
## [br][param crop_transparent] Whether or not to remove transparent portions of the texture.
## [br][param default_files] The list of file suffixes in the [constant DEFAULT_SKIN_PATH].
## [br][param max_frames] The maximum number of frames to return, even if more textures exist.
## [br][param return] The texture(s) bundled together as an animation.
## TODO: This function should return null on complete failure as this will allow alternate logic to function correctly.
## @experimental
func _get_texture(cur_files: Array[String], key: String, skin_path: String, animation_prefix := "-", crop_transparent := true, default_files: Array[String] = [".png"], max_frames := AnimatedTexture.MAX_FRAMES) -> AnimatedTexture:
	if cur_files.is_empty():
		skin_path = DEFAULT_SKIN_PATH
		cur_files = default_files

	var frame_idx := 0
	var new_texture := AnimatedTexture.new()
	for file_name in cur_files:
		# TODO: Where does this come from? This needs rethinking.
		if animation_prefix == "-":
			file_name = file_name.trim_prefix("_")
			max_frames = 1
			animation_prefix = ""

		if file_name.begins_with(animation_prefix + str(frame_idx)):
			frame_idx += 1

		if frame_idx <= max_frames:
			new_texture.frames = int(str(max(1, frame_idx)))
			new_texture.set_frame_texture(new_texture.frames - 1, _texture_from_image(skin_path.path_join((key + file_name).replace("_", "-")), crop_transparent))

	return new_texture


## Loads a texture from an image file during runtime.
## [br][param file_path] The absolute path to the image file.
## [br][param crop_transparent] Whether or not to remove transparent portions of the image.
## [br][param return] The texture from the image file.
func _texture_from_image(file_path: String, crop_transparent := true) -> ImageTexture:
	var image := Image.new()
	if file_path.begins_with("res://"):
		image = (load(file_path) as Texture2D).get_image()

	elif image.load(file_path):
		return ImageTexture.new()

	if crop_transparent and not image.is_invisible():
		image = image.get_region(image.get_used_rect())

	return ImageTexture.create_from_image(image)
