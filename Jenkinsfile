#!/usr/bin/env groovy

pipeline {

    agent any
    environment {
        REPO = "Maxew42/mlops_lab_6"
    }
    stages {
        stage('Installing dependancies') {
            steps {
                sh """
                    pip3 install flake8 pytest
                    pip3 install -r requirements.txt
                """
            }
        }
        stage('Testing') {
            steps {
                sh """
                    python3 -m unittest
                """
                echo '$REPO'
            }
        }
        stage('Build docker image') {
            steps {   
                sh """
                    docker build -t maxew42/fashion-mnist:latest .
                """
                script {
                    try {
                        sh """
                            docker stop maxew42/fashion-mnist:latest
                        """
                    } catch (err) {
                        echo err.getMessage()
                    }
                }

                sh """
                    docker run -d -p 8012:8012 maxew42/fashion-mnist:latest 
                """
            }
        }
    
    }
}