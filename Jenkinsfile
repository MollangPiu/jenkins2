pipeline {
    agent any

    environment {
        HOST_IP = "192.168.56.1"
        HOST_USER = "hayar"
        SPRING_CONTAINER = "springboot_app"
        JAR_PATH_LOCAL = "build/libs/app.jar"
        JAR_PATH_REMOTE = "/app/app.jar"
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
                    echo "📤 JAR 파일 복사 중..."
                    scp -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no ${JAR_PATH_LOCAL} ${HOST_USER}@${HOST_IP}:${JAR_PATH_REMOTE}

                    echo "🔁 컨테이너 재시작 중..."
                    ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no ${HOST_USER}@${HOST_IP} "docker restart ${SPRING_CONTAINER}"
                '''
            }
        }
    }
}
