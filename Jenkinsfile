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

        stage('Run UI tests') {
            steps {
                sh '''
                    mkdir -p results/ui/allure

                    docker run --rm \
                        --volumes-from jenkins \
                        -e EXECUTION=REMOTE \
                        -e REMOTE_URL=http://host.docker.internal:4444/wd/hub \
                        -w ${WORKSPACE} \
                        robot-test-framework \
                        -d results/ui \
                        --variable BROWSER:${BROWSER:-Chrome} \
                        --listener RetryFailed:1 \
                        --listener allure_robotframework:results/ui/allure \
                        page_object_pattern/tests
                '''
            }
        }
    }

    post {
        always {
            allure([
                includeProperties: false,
                jdk: '',
                results: [
                    [path: 'results/api/allure'],
                    [path: 'results/ui/allure']
                ]
            ])

            archiveArtifacts(
                artifacts: 'results/**/*',
                allowEmptyArchive: true
            )
        }
    }
}