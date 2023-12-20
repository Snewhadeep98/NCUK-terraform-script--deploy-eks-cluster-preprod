#!/usr/bin/env groovy

pipeline {

    agent any

    environment {

        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')

        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')

        AWS_DEFAULT_REGION = "eu-west-3"

    }

    stages {

        stage("Create an EKS Cluster") {

            steps {

                script {

                    dir('terraform') {

                        sh "terraform init -reconfigure"

                        sh "terraform validate"

                        sh "terraform plan"

                        sh "terraform apply -auto-approve"

                    }

                }

            }

        }

        stage("Deploy to EKS") {

            steps {

                script {

                    dir('kubernetes') {

                        withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: '155c8573-fb81-4916-847c-ca7403bf1a0b', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                        
                        sh "kubectl apply -f deployment.yaml"

                        sh "kubectl apply -f service.yaml"
}

                    
                    

                    }

                }

            }

        }

    }

}
