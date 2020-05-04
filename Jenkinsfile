pipeline {
   agent {
       docker {
           image 'alesiruan/mypywd'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando/baixando as dependências do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Tests') {
         steps {
            echo 'Executando testes de regressão'
            sh 'robot -d ./log tests/'
            robot 'log'
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
