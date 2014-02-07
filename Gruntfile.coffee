module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['common/_coffee/*.coffee']
      tasks: 'coffee'
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'coffee/'
          src: ['**/*.coffee']
          dest: 'common/js/'
          ext: '.js'
        ]
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    jade:
      compile:
        files:
          '_templates/layout.html': ['common/_jade/layout.jade']
    stylus:
      compile:
        files:
          'common/css/style.css': ['common/_stylus/style.styl']
    watch:
      files: ['common/_jade/layout.jade', 'common/_stylus/overwrite.styl']
      tasks: ['jade', 'stylus']


  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-marked'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']

  return