pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'MHS',
                    branch: 'main',
                    url: 'https://github.com/MollangPiu/jenkins.git'
            }
        }

        stage('Build') {
            steps {
                bat 'gradlew.bat clean build'
            }
        }

        stage('Deploy to Server') {
            steps {
                bat '''
                    scp -i C:/ProgramData/Jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no build\\libs\\study-0.0.1-SNAPSHOT.jar vagrant@192.168.56.100:/home/vagrant/

                    ssh -i C:/ProgramData/Jenkins/.ssh/id_rsa -o StrictHostKeyChecking=no vagrant@192.168.56.100 "echo 'nohup java -jar /home/vagrant/study-0.0.1-SNAPSHOT.jar > /home/vagrant/nohup.out 2>&1 &' > /home/vagrant/run.sh && chmod +x /home/vagrant/run.sh && /home/vagrant/run.sh"
                '''
            }
        }
    }
}
