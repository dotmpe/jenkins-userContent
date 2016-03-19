'use strict';

var fs = require('fs');


module.exports = function(grunt) {

  var env = grunt.option('env') || 'dev';
  var build_features_file = 'build-features.'+env+'.properties';
  var features_defaults_file = 'default-features.properties';

  var features_file;

  if (fs.existsSync(build_features_file)) {
    features_file = build_features_file;
  } else {
    features_file = features_defaults_file;
  }

  // FIXME: feature compilation
  //var features = grunt.option('features') || 'doony-js extra-js';

  //var feature;
  //for (feature in features.split(' ')) {
  //}

  grunt.initConfig({
    env: env,
    build_features_file: features_file,
    properties: {
      features: features_file
    },
    pkg: grunt.file.readJSON('package.json'),

    jshint: {
      options: {
        jshintrc: '.jshintrc',
      },

      clireport: {
        src: [
          'package.json', '*.js'
        ]
      },

      all: {
        options: {
          jshintrc: '.jshintrc',
          reporterOutput: "build/checkstyle/jshint-results.xml",
          reporter: 'checkstyle'
        },
        src: [
          'package.json', '*.js'
        ]
      }
    },

    shell: {
      "bats-test": {
        command: 'bats ./test/*-spec.bats'
      },
      "version-check": {
        command: 'git-versioning check'
      },
      generateFeatures: {
        command: 'node ./gen-features.js > ' + build_features_file
      },
      bootstrapCss: {
        command: 'recess --compile node_modules/twitter-bootstrap/less/bootstrap.less > bootstrap.css'
      },
      userContentStylus: {
        command: 'stylus --include-css --import '+ features_file +' userContent.styl'
      },
      userContentJs: {
        command: './build-userContent-js.sh '+ features_file
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

  });

  // auto load grunt contrib tasks from package.json
  require('load-grunt-tasks')(grunt);

  grunt.registerTask('test', [
    'jshint:all',
    'shell:version-check',
    'shell:bats-test'
  ]);

  grunt.registerTask('build', [
    'shell:userContentJs',
    'shell:bootstrapCss',
    'shell:userContentStylus'
  ]);

  // Default task.
  grunt.registerTask('default', [
    'build',
    'test',
  ]);

};
