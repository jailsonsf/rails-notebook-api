pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                discordSend description: "Build Started\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: env.WEBHOOK_URL

                sh 'docker compose down'
                sh 'docker compose build'
            }
        }
        
        stage('Prepare database') {
            steps {
                sh 'docker compose run web rails db:drop db:create db:migrate RAILS_ENV=test'
            }

            post {
                failure {
                    discordSend description: "Build - ${currentBuild.currentResult}\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: env.WEBHOOK_URL
                }
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker compose run web bundle exec rspec'
            }
            
            post {
                failure {
                    discordSend description: "Build - ${currentBuild.currentResult}\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: env.WEBHOOK_URL
                }
            }
        }
        
        stage('Run API') {
            steps {
                sh 'docker compose build'
                sh 'docker compose up -d --add-host host.docker.internal:host-gateway'
            }
            
            post {
                always {
                    discordSend description: "Build - ${currentBuild.currentResult}\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: env.WEBHOOK_URL
                }
            }
        }
    }
}
