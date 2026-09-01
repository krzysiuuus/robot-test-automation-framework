pipeline {

    agent any

    options {
        skipDefaultCheckout(true)
    }

    triggers {
        pollSCM('H/5 * * * *')
    }

    parameters {
        choice(
            name: 'BROWSER',
            choices: ['chrome', 'firefox', 'edge'],
            description: 'Browser used for UI tests'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/krzysiuuus/python-test-automation-framework.git'
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
                    rm -rf results
                    mkdir -p results/api/allure

                    docker run --rm \
                        --volumes-from jenkins \
                        -w ${WORKSPACE} \
                        robot-test-framework \
                        -d results/api \
                        --listener allure_robotframework:results/api/allure \
                        api_tests/tests

                    find results -maxdepth 3 -type f -print
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