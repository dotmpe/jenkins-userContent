:Version: 0.0.3-dev
:Test status:

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


Prerequisites:

- Node
- Bats
- (git-versioning)


.. Id: jenkins-usercontent/0.0.2-master ReadMe.rst

