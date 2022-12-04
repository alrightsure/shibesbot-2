FROM rust:1.65 as builder
WORKDIR /usr/src/shibesbot-2
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/shibesbot-2 /usr/local/bin/shibesbot-2
CMD ["shibesbot-2"]