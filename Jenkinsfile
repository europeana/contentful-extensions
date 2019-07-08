pipeline {
  options {
    disableConcurrentBuilds()
  }
  agent any
  environment {
    CF_HOME="${env.WORKSPACE}/.cf"
    CF_API="${env.CF_API}"
    CF_LOGIN=credentials('contentful-extensions.cloudfoundry.login')
    CF_ORG="${env.CF_ORG}"
    CF_SPACE="${env.BRANCH_NAME ==~ /\Av\d+\.\d+\.\d+\z/ ? 'production' : 'test'}"
  }
  stages {
    stage('Login to CF') {
      steps {
        sh 'mkdir -p ${CF_HOME}'
        sh 'cf login -a ${CF_API} -u ${CF_LOGIN_USR} -p "${CF_LOGIN_PSW}" -o ${CF_ORG} -s ${CF_SPACE}'
      }
    }
    stage('Deploy to CF') {
      environment {
        CF_APP_NAME="contentful-extensions${env.CF_SPACE == 'production' ? '' : '-' + env.CF_SPACE}"
      }
      steps {
        sh 'cf blue-green-deploy ${CF_APP_NAME} -f manifest.yml --delete-old-apps'
      }
    }
  }
}
