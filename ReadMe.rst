:Version: 0.0.2-test
:Test status:

  .. image:: https://secure.travis-ci.org/dotmpe/jenkins-userContent.png
    :target: https://travis-ci.org/dotmpe/jenkins-userContent
    :alt: Build
  

- Some styling of Jenkins and report HTML in Jenkins. See Gruntfile for how
  files are build. Includes Doony_

.. _Doony: https://doony.org/

- At the jenkins server, the URLs /userContent/userContent.{css,js} are
  copied there after building from this repository.

- To build, jenkins runs `npm` and `grunt` to ensure modules are up to date
  and files are jshinted and refreshed.

.. Id: jenkins-usercontent/0.0.2-test ReadMe.rst

