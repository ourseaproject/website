module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['coffee/**/*.coffee']
      tasks: 'coffee'
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'coffee/'
          src: ['**/*.coffee']
          dest: 'Resources/'
          ext: '.js'
        ]

  grunt.initConfig
    jade:
      compile:
        files:
          'index.html': ['jadeja/*.jade']
    stylus:
      compile:
        files:
          'default.css': ['stylus/*.stylus']
    watch:
      files: ['jade/*.jade', 'stylus/*.stylus']
      tasks: ['jade', 'stylus']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']

  return