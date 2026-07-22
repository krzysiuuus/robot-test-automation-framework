pipeline {

    agent any

    parameters {
        choice(
            name: 'BROWSER',
            choices: ['Chrome', 'Firefox', 'Edge'],
            description: 'Browser used for UI tests'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/krzysiuuus/robot-test-automation-framework.git'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t robot-test-framework .'
            }
        }

        stage('Run API tests') {
            steps {
                sh '''
                    docker run --rm \
                    -v $(pwd)/results:/app/results \
                    robot-test-framework \
                    -d results/api \
                    --listener allure_robotframework:results/api/allure \
                    api_tests/tests
                '''
            }
        }

        stage('Publish Allure Report') {
            steps {
                allure([
                    includeProperties: false,
                    jdk: '',
                    results: [[path: 'results/api/allure']]
                ])
            }
        }
    }

    post {
        always {
            archiveArtifacts(
                artifacts: 'results/**/*',
                allowEmptyArchive: true
            )
        }
    }
}