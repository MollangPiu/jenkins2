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

        stage('Deploy (Copy to Shared)') {
            steps {
                sh '''
                    echo "📤 빌드된 JAR 복사 중..."
                    cp ${JAR_SOURCE} ${JAR_TARGET}
                '''
            }
        }
    }
}
