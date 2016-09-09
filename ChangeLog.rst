0.0.2
  - Building using travis script. However that plugin is getting old, does not
    support all Travis YAML features.

    Have issues creating a Travis job in Jenkins
    using JJB (1.4.1.dev217). Raw XML for plugin is not accepted.

    Manual action required to add Travis YML build step.

  - Minor doc updates.

0.0.3
  - Build config updates.
  - Added dependency installer script.
  - Restructured Grunt targets a bit, main targets are now "check build test".
  - Added generic package.yml metadata.

[0.0.4]
  - FIXME: JJB test not working at jenkins.
  - FIXME: pre-install deps will not work at jenkins without sudo/permissions in
    /usr/local
  - TODO: job-parts JTB processer maybe.


