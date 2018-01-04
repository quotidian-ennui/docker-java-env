# docker-java-env
Just a simple Dockerfile that allows you to bootstrap a docker based java build environment for ant+ivy, maven, and gradle (using the gradle wrapper). It's not very interesting to be honest, all the hard work has been done by the maven maintainers.

* maven:3.5.2-alpine is the base image
* apache-ant is available as an apk already.
* gradle we just run via the gradle wrapper.

```
docker volume create maven-cache
docker volume create gradle-cache
docker volume create ivy-cache
docker run --rm -v "$(pwd):/src" -v gradle-cache:/root/.gradle -v maven-cache:/root/.m2 -v ivy-cache:/root/.ivy2 lewinc/docker-java-env ant|mvn|./gradlew $*
```

or if you're that way inclined, you can edit your bash profile

```
docker-ant() {
  docker run --rm -v "$(pwd):/src" -v gradle-cache:/root/.gradle -v maven-cache:/root/.m2 -v ivy-cache:/root/.ivy2  lewinc/docker-java-env ant $*
}

docker-mvn() {
  docker run --rm -v "$(pwd):/src" -v gradle-cache:/root/.gradle -v maven-cache:/root/.m2 -v ivy-cache:/root/.ivy2  lewinc/docker-java-env mvn $*
}

docker-gradle() {
  docker run --rm -v "$(pwd):/src" -v gradle-cache:/root/.gradle -v maven-cache:/root/.m2 -v ivy-cache:/root/.ivy2  lewinc/docker-java-env ./gradlew $*
}
```

