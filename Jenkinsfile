pipeline {
    agent any

    environment {
        SPRING_CONTAINER = "springboot_app"
        JAR_PATH = "build/libs/app.jar"         // 빌드 결과 JAR
        CONTAINER_JAR_PATH = "/app/app.jar"     // 컨테이너 내 JAR 위치
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'MHS',
                    url: 'https://github.com/MollangPiu/jenkins.git',
                    branch: 'main'
            }
        }

        stage('Build') {
            steps {
                chmod +x ./gradlew     # 👈 실행 권한 부여
                sh './gradlew clean build'
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