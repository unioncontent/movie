module.exports = {
  apps: [
    {
      // pm2로 실행한 프로세스 목록에서 이 애플리케이션의 이름으로 지정될 문자열
      name: "mail",
      // pm2로 실행될 파일 경로
      // script: " ./bin/www",
      script: "./bin/www",
      // 개발환경시 적용될 설정 지정
      // watch: true,
      env: {
        "PORT": 3000,
        "NODE_ENV": "development"
      },
      // 배포환경시 적용될 설정 지정
      env_production: {
        "PORT": 80,
        "NODE_ENV": "production"
      },
      // "exec_mode": "cluster",
      // "instances": 0,
      "wait_ready": true,
      "listen_timeout": 10000,
      "kill_timeout": 5000,
      "restart_delay": 1000
    }
  ]
};
