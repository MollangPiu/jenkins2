pipeline {
    agent any

    environment {
        SPRING_CONTAINER = "springboot_app"
        JAR_PATH = "build/libs/app.jar"
        CONTAINER_JAR_PATH = "/app/app.jar"
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'MHS',
                    url: 'https://github.com/MollangPiu/jenkins2.git',
                    branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    chmod +x ./gradlew
                    ./gradlew clean build
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    echo "Stopping old container..."
                    docker stop ${SPRING_CONTAINER} || true

                    echo "Copying new JAR into container..."
                    docker cp ${JAR_PATH} ${SPRING_CONTAINER}:${CONTAINER_JAR_PATH}

                    echo "Restarting container..."
                    docker start ${SPRING_CONTAINER}
                '''
            }
        }
    }
}
