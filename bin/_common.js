const spawnSync = require('child_process').spawnSync
const path = require('path')
const fs = require('fs')

const vocabularyDirectory = path.resolve(
  path.join(__dirname, '..', 'input', 'vocabulary', 'valueset')
)
const fshGeneratedDirectory = path.resolve(
  path.join(__dirname, '..', 'fsh-generated', 'resources')
)
const testDirectory = path.resolve(path.join(__dirname, '..', 'input', 'tests'))

function execCommand(command) {
  spawnSync(command, [], { shell: true, stdio: 'inherit' })
}

function readFiles(dirname, onFileContent, onError) {
  fs.readdir(dirname, function (err, filenames) {
    if (err) {
      onError(err)
      return
    }
    filenames.forEach(function (filename) {
      fs.readFile(dirname + '/' + filename, 'utf-8', function (err, content) {
        if (err) {
          onError(err)
          return
        }
        onFileContent(filename, content)
      })
    })
  })
}

module.exports = {
  vocabularyDirectory,
  fshGeneratedDirectory,
  testDirectory,
  execCommand,
  readFiles,
}
