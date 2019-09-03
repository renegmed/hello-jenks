pipeline {
    environment {
      registry = "renegmedal/getintodevops-hellonode"
      dockerImage = ''
    }
     
    

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        //app = docker.build("getintodevops-hellonode")
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }  
    }

    // stage('Test image') {
    //     /* Ideally, we would run a test framework against our image.
    //      * For this example, we're using a Volkswagen-type approach ;-) */

    //     app.inside {
    //         sh 'echo "Tests passed"'
    // }
    //  }

      
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
        //  * Pushing multiple tags is cheap, as all the layers are reused. */
        // docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
        //     app.push("${env.BUILD_NUMBER}")
        //     //app.push("latest")

        // }
        steps{
          script {
            docker.withRegistry('', 'DockerHub') {
              dockerImage.push()
            }
          }
        }
    }

    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }


    // stage('Clean up workspace') {
    //     //Clean up our workspace.
    //     deleteDir()
    // }

}
