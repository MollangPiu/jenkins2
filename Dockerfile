# Java 17 JDK 기반의 경량 이미지
FROM openjdk:17-jdk-slim

# 작업 디렉토리 지정
WORKDIR /app

# jar는 외부에서 마운트로 주입
# (복사 안 함) / 여기서 정의시 마운트가 아니라 대상을 복사

# 컨테이너가 열 포트
EXPOSE 8080

# 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]
