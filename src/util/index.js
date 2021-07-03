const modules = import.meta.globEager('../assets/*.png')

export function getIcon(icon) {
  try {
    const path = `../assets/${icon}`
    return modules[path].default
  } catch (e) {
    return null
  }
}
