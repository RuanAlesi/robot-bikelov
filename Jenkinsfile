pipeline {
   agent {
       docker {
           image 'python'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando/baiando as dependências do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Tests') {
         steps {
            echo 'Executando testes de regressão'
            sh 'robot -d ./log tests/'
         }
      }
      stage('UAT') {
         steps {
            echo 'Aguardando testes de aceitação do usuário'
            input(message: 'Go to production?', ok: 'Yes')
         }
      }
      stage('Production') {
         steps {
            echo 'App is ready'
         }
      }
   }
}
