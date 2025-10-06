FROM alpine:3.20

WORKDIR /app
COPY app.sh .

# сделать скрипт исполняемым, создать non-root пользователя и выдать права
RUN chmod +x app.sh \
  && adduser -D -u 10001 appuser \
  && chown -R appuser:appuser /app

USER appuser
ENTRYPOINT ["./app.sh"]

