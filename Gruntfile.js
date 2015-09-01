'use strict';

module.exports = function(grunt) {

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    jshint: {
      options: {
        jshintrc: '.jshintrc',
        reporter: require("jshint-junit-reporter"),
        reporterOutput: "build/junit-out/jshint.xml"
      },
      all: {
        src: [
          'package.json', '*.js'
        ]
      }
    },

    shell: {
      bootstrapCss: {
        command: 'recess --compile node_modules/twitter-bootstrap/less/bootstrap.less > bootstrap.css'
      },
      userContentStylus: {
        command: 'stylus --include-css userContent.styl'
      },
      userContentJs: {
        command: 'sh -c ./build-userContent-js.sh'
      }
    },

    watch: {
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      lib: {
        files: '<%= jshint.lib.src %>',
        tasks: [
          'jshint:src',
          'nodeunit'
        ]
      },
      test: {
        files: '<%= jshint.test.src %>',
        tasks: [
          'jshint:test',
          'jasmine_node'
        ]
      },
    },

    // XXX: could use for other XML results maybe
    //junit_report: {
    //  options: {
    //    // Task-specific options go here.
    //  },
    //  your_target: {
    //    // Target-specific file lists and/or options go here.
    //  },
    //},

  });

  // auto load grunt contrib tasks from package.json
  require('load-grunt-tasks')(grunt);

  grunt.registerTask('lint', [
    'jshint'
  ]);


  // Default task.
  grunt.registerTask('default', [
    'lint',
    'shell:bootstrapCss',
    'shell:userContentStylus',
    'shell:userContentJs'
  ]);

};
