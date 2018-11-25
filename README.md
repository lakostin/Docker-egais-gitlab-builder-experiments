# Docker-egais-gitlab-builder

Docker image for build http://lesegais.ru related projects on `gitlab-ci`.
It is intended to build `Java` `gradle` projects as backend and also `Sencha` and `React` frontend projects too.

Based on latest Fedora image and include next main packages:
 * `java-1.8.0-openjdk-devel` and `java-1.8.0-openjdk-headless` - as main language is java and `groovy` wrapper used
 * `ruby` - for use `SenchaCMD`
 * `git` - `gradle-node-plugin` require it to `npm` build (@see http://git.taskdata.com/Hubbitus/glr-portal/builds/984)
 * `postgres` - client utils to console query databases and ping it
 * `docker docker-compose helm kubernetes-client` - to up stack for testing
 * `jq` - for Gitlab API processing

There also enabled epel-repo.

Several packages for comfort work included also (like `httpie`, `iproute`, `postgres`, `docker`)...
