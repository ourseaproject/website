module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    connect:
      server:
        options:
          # LiveReloadに必要なスクリプトを</body>直前に挿入してくれる
          # 多分grunt-contrib-connect ver.0.4.0から
          # HTML5などでbodyタグを書いていないと挿入してくれないみたい……
          livereload: true
    watch:
      files: ['common/_coffee/*.coffee', 'common/_jade/layout.jade', 'common/_stylus/overwrite.styl']
      tasks: ['coffee', 'jade', 'stylus']
      options:
        livereload:
          enabled: true
          port: 35729
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'coffee/'
          src: ['**/*.coffee']
          dest: 'common/js/'
          ext: '.js'
        ]
    jade:
      compile:
        files:
          '_templates/layout.html': ['common/_jade/layout.jade']
    stylus:
      compile:
        files:
          'common/css/style.css': ['common/_stylus/style.styl']
          'common/css/overwrite.css': ['common/_stylus/overwrite.styl']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['connect', 'watch']

  return