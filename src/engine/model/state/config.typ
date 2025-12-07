#let _config = state("_config", (:))

#let get() = _config.get()
#let update(config) = _config.update(config)