# Build OPA Service directory, load policies and data, install and run OPA daemon
#FROM alpine:latest
#RUN apk --no-cache add curl  
#ADD $PWD/data /data
#VOLUME /data RUN curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64_static
#RUN chmod 755 /home/ec2-user/helloopa-service/opa-service/opa EXPOSE 8181
#CMD /home/ec2-user/helloopa-service/opa-service/opa run -s ./data --skip-version-check
#RUN chmod 755 ./opa EXPOSE 8181
#CMD ./opa run -s ./data --skip-version-check

# Use a minimal base image
FROM alpine:latest

# Install curl for downloading OPA
RUN apk --no-cache add curl  

# Download OPA binary
RUN curl -L -o /opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64_static && \
    chmod 755 /opa

# Create a directory for data
WORKDIR /data

# Copy local data directory into the container
COPY data /data

# Declare the /data directory as a volume
VOLUME /data

# Expose OPA's default HTTP API port
EXPOSE 8181

# Command to run the OPA service
CMD ["/opa", "run", "-s", "/data", "--disable-telemetry"]