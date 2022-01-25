FROM rust:1.58 as builder
RUN cargo install matchbox_server
FROM debian:buster-slim
RUN apt-get update && apt-get install -y libssl1.1 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/matchbox_server /usr/local/bin/matchbox_server
CMD ["matchbox_server"]