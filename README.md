# Docker-egais-gitlab-builder

Docker image for build http://lesegais.ru related projects on `gitlab-ci`.
It is intended to build `Java` `gradle` projects as backend and also `Sencha` and `React` frontend projects too.

Based on latest Centos image and include next main packages:
 * `java-1.8.0-openjdk-devel` and `java-1.8.0-openjdk-headless` - as main language is java and `groovy` wrapper used
 * `ruby` - for use `SenchaCMD`
 * `git` - `gradle-node-plugin` require it to `npm` build (@see http://git.taskdata.com/Hubbitus/glr-portal/builds/984)

There also enabled epel-repo.

Several packages for comfort work included also (like `httpie`, `postgres`, `docker`)...
