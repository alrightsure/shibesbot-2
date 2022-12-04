FROM rust:1.65 as builder
WORKDIR /usr/src/shibesbot-2
COPY . .
RUN cargo install --path .

CMD ["shibesbot-2"]