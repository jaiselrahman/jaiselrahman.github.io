workflow "Deploy to Github Pages" {
  on = "push"
  resolves = ["Deploy to gh-pages"]
}

action "Use master branch" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch master"
}

action "Deploy to gh-pages" {
  uses = "JamesIves/github-pages-deploy-action@master"
  needs = ["Use master branch"]
  secrets = ["ACCESS_TOKEN"]
  env = {
    BRANCH = "gh-pages"
    BUILD_SCRIPT = "npm install && npm run build --modern"
    FOLDER = "dist"
  }
}
