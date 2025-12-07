#let _frames-per-section = state("_frames-per-section", ())

#let extend() = _frames-per-section.update(curr => curr + (0, ))

#let step() = _frames-per-section.update(curr => {
  if curr.len() > 0 {
    curr.at(-1) += 1
  }
  return curr
})

#let get-current() = _frames-per-section.get()
#let get-final() = _frames-per-section.final()