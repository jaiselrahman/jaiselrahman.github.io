workflow "Deploy to Github Pages" {
  on = "push"
  resolves = ["Deploy to master"]
}

action "Use src branch" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "branch src"
}

action "Deploy to master" {
  uses = "JamesIves/github-pages-deploy-action@master"
  needs = ["Use src branch"]
  secrets = ["ACCESS_TOKEN"]
  env = {
    BASE_BRANCH = "src"
    BRANCH = "master"
    BUILD_SCRIPT = "npm install && npm run build --modern"
    FOLDER = "dist"
  }
}