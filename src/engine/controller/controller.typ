#import "../model/model.typ" as _model
#import "../view/view.typ" as _view

#import "header.typ" as _header

#import "../../utils/utils.typ" as _utils

#let spectacle(base, overrides, document) = {
  let config = _utils.merge(base, overrides)
  _model.modifier.update-config(config)
  
  set page(
    paper: config.layout.frame.paper.str,
    margin: config.layout.frame.margin,
    header-ascent: config.layout.frame.header-ascent,
    footer-descent: config.layout.frame.footer-descent,
    fill: config.style.frame.fill,
  )

  document
}

#let add-section(section) = _model.modifier.add-section(section)

#let _build-frame(frame-info, ctx) = {
  let header = _header.create(ctx)

  page(header: {rect(height: 90pt, width: 100%, inset: (top: 0pt, left: 10pt, right: 10pt, bottom: 10pt), align(top + center, header))})[ciao]
}

#let add-frame(frame-info) = _model.modifier.add-frame() + context {
  _build-frame(frame-info, _model.observer.ctx())
}