FROM rust:1.64 as builder
RUN cargo install matchbox_server
FROM debian:buster-slim
ARG PORT
RUN apt-get update && apt-get install -y libssl1.1 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/matchbox_server /usr/local/bin/matchbox_server
CMD export HOST=0.0.0.0:$PORT && matchbox_server