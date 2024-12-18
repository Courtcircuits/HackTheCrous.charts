FROM debian:bookworm-slim
RUN apt update && apt -y install postgresql-client
COPY . .
CMD ["/bin/bash", "-c"]
