#let merge(base, overrides) = {
  let result = base 
  for (key, override-val) in overrides {
    if key not in base {
      continue
    }
    let base-val = base.at(key)
    result.at(key) = if (
      type(base-val) == dictionary and type(override-val) == dictionary
    ) {
      merge(base-val, override-val)
    } else {
      override-val
    }
  }
  return result
}