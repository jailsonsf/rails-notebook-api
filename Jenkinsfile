pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                discordSend description: "Build Started\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: 'https://discord.com/api/webhooks/1100472630072574063/YnidpSF32GgZ9f_McXjDHFiqafD3fE6XTD1ZTx6M05uQU5YaBRiVwW15dvse2wAmEbD7'

                sh 'docker compose down'
                sh 'docker compose build'
            }
        }
        
        stage('Prepare database') {
            steps {
                sh 'docker compose run web rails db:drop db:create db:migrate RAILS_ENV=test'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker compose run web bundle exec rspec'
            }
            
            post {
                always {
                    discordSend description: "Build - ${currentBuild.currentResult}\n${env.JOB_NAME}", footer: env.BUILD_TAG, image: '', link: env.BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', thumbnail: '', title: env.JOB_NAME, webhookURL: 'https://discord.com/api/webhooks/1100472630072574063/YnidpSF32GgZ9f_McXjDHFiqafD3fE6XTD1ZTx6M05uQU5YaBRiVwW15dvse2wAmEbD7'
                }
            }
        }
    }
}
