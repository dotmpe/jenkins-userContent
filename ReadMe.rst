:Version: 0.0.3-dev
:package: Changelog_

  .. image:: https://gemnasium.com/dotmpe/jenkins-userContent.png
    :target: https://gemnasium.com/dotmpe/jenkins-userContent
    :alt: Dependencies

  .. image:: https://david-dm.org/dotmpe/jenkins-userContent/dev-status.svg?style=flat-square
    :target: https://david-dm.org/dotmpe/jenkins-userContent
    :alt: Dependencies

:project:

  .. image:: https://secure.travis-ci.org/dotmpe/jenkins-userContent.png
    :target: https://travis-ci.org/dotmpe/jenkins-userContent
    :alt: Build


- Some styling of Jenkins and report HTML in Jenkins. Optionally includes Doony_
  CSS / scripts.

.. _Doony: https://doony.org/


See the build-feature files and Gruntfile, or one of the CI config examples for Travis or jenkins for details.


- At the jenkins server, the URLs /userContent/userContent.{css,js} are
  copied there after building from this repository.

- To build, jenkins runs `npm` and `grunt` to ensure modules are up to date
  and files are jshinted and refreshed.

- Added Handlebars templater to client-side libraries.


Prerequisites for build:

- Node, NPM
- Bats
- git-versioning
- Python docutils
- uuidgen (uuid-runtime)


.. _changelog: ./Changelog.rst

.. Id: jenkins-usercontent/0.0.3-dev ReadMe.rst
