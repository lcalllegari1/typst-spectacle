#import "state/sections.typ" as _sections
#import "state/frames.typ" as _frames
#import "state/config.typ" as _config

#let update-config(config) = _config.update(config)

#let add-section(section) = _sections.add(section) + _frames.extend()
#let add-frame() = _frames.step()