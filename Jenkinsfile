pipeline {
    agent any

    environment {
        SPRING_CONTAINER = "springboot_app"
        JAR_SOURCE = "build/libs/study-0.0.1-SNAPSHOT.jar"
        JAR_TARGET = "/shared/study-0.0.1-SNAPSHOT.jar"  // 공유된 호스트 폴더 경로
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
                    cp build/libs/study-0.0.1-SNAPSHOT.jar /shared/study-0.0.1-SNAPSHOT.jar
                '''
            }
        }
    }
}
