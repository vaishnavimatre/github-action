# Base WORKDIR => /
FROM openjdk:24-jdk-slim
WORKDIR /app

# Define build-time argument
ARG imageName

# Set environment variable from ARG
ENV IMAGE_NAME=${imageName}

# Copy Jar from build context to /app directory in the image
COPY target/${IMAGE_NAME}.jar ${IMAGE_NAME}.jar

# Set the entry point
ENTRYPOINT ["sh", "-c", "java -jar /app/${IMAGE_NAME}.jar"]