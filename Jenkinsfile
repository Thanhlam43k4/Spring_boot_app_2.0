pipeline {
    agent any
    tools{
        maven 'Maven-3.9.4'
    }
    stages{
        stage('Git checkout'){
            steps{
                echo "Pull Code From GitHub..."
                git credentialsId: 'jenkins_token1', url: 'https://github.com/Thanhlam43k4/Spring_boot_app_2.0.git'
            }
        }
        stage('Test'){
            steps{
                echo "Testing....."
                sh 'mvn --version'
                sh 'java --version'
                sh 'mvn clean package'
            }
        }
        stage('Packaging/Pushing image'){
            steps{
                    sh 'ls -ltr'
                    withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                        sh 'docker build -t thanhlam2k4/spring_boot_app:4.0 .'
                        sh 'docker push thanhlam2k4/spring_boot_app:4.0'

                    }
                         
                }
        }
        stage('Deploying to Kubernetes!!'){
            steps{
                scripts{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sid')
                }
            }

        }
            
        
    }
    // post{
    //     // Clean after build
    //     always{
    //         cleanWs()
    //     }
    // }
}