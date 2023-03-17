FROM golang:1.20.2-bullseye

ENV TZ="Asia/Tokyo"

WORKDIR /var/www/shrine-api/
COPY . .

RUN ["/bin/bash" "-c", "go install"]
RUN ["go", "build", "-mod=vendor", "-v", "-o" "/usr/local/bin/api", "main.go"]

EXPOSE 8080
CMD ["api"]
