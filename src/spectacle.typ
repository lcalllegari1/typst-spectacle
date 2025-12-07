#import "engine/controller/controller.typ" as _controller

#import "config/default.typ" as _config

#let spectacle(overrides: (:), document) = {
  _controller.spectacle(_config.base, overrides, document)
}

#let section(title) = _controller.add-section((title: title))

#let frame(title, steps: 1, slide) = {
  _controller.add-frame((title: title, steps: steps, slide: slide))
}