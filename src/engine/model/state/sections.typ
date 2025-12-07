#let _sections = state("_sections", ())

#let add(section) = _sections.update(curr => curr + (section, ))

#let get-current() = _sections.get()
#let get-final() = _sections.final()