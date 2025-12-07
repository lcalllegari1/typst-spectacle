#import "state/sections.typ" as _sections
#import "state/frames.typ" as _frames
#import "state/config.typ" as _config

#let ctx() = {
  let current-sections = _sections.get-current()
  let final-sections = _sections.get-final()
  let current-frames = _frames.get-current()
  let final-frames = _frames.get-final()
  (
    config: _config.get(),
    sections: (
      active: if current-sections.len() > 0 {
        (
          title: current-sections.last().title, 
          idx: current-sections.len() - 1,  
        )
      } else { none },
      final: (
        titles: final-sections.map(sec => sec.title),
        list: final-sections,
      ),
    ),
    frames: (
      active: (
        idx: if current-frames.len() > 0 {
          current-frames.sum() - 1
        } else { none },
      ),
      final: (
        count: final-frames.sum(),
        distr: final-frames,
      )
    ),
  )
}