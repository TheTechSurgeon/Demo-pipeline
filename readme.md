link to the  docker hub repo https://hub.docker.com/repository/docker/developerben/pet-clinic-demo/general
Command to run for the Docker image: docker run -p 8080:8080 petclinic:latest

Explaining the work:

Task - Build a pipeline
1. Use Spring pet-clinic (https://github.com/spring-projects/spring-petclinic) as your
project source code

I forked the repo and cloned it onto my local machine.


2. Build a Jenkins pipeline with the following steps:

I didn't have jenkins, I so I installed and configured it integrating a JDK that met petclinic's minimum requirements

a. Compile the code

I decided that although it would be possible to compile the jar inside the docker container that it would be better to scan it while it was outside the docker image
I've run afoul many times of built images not providing the same SCA results when compiled.

b. Run the tests

I put in a step to run the pre-existing tests

c. Package the project as a runnable Docker image

Since docker has some known issues with jenkins I figured that instead of working around that I'd pick a method worthy of a 5 hour time limit.
I decided the simplest method would be to pass the compiled jar as an env. variable

3. Make sure all dependencies are resolved from JCenter

My settings.xml file and the pom.xml in the projec both point to Jcenter

4. Bonus - use JFrog Artifactory in your pipeline

I did manage to get Artifactory running after discovering that running it as a service on manjaro required far more pain than it was worth. I ran it manually. Unfortunately I did not include it in this project


Deliverables
1. GitHub link to the repo including x
1. Jenkins file within that repo x
2. Docker file within that repo x
3. readme.md file explaining the work and how to run the project x
2. Attached runnable docker image + the command to run it x
3. Build and deliver a presentation illustrating how you would add security within this >
pipeline. Be as specific as possible in your technology recommendations.x
4. Bonus - Show us security checks you implemented in the pipeline x
