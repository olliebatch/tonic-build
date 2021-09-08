FROM arm64v8/rust:1.54

WORKDIR /usr/src/myapp
COPY . .

RUN cargo install cross

RUN rustup component add rustfmt

RUN rustup target add x86_64-unknown-linux-musl

RUN cross build --target x86_64-unknown-linux-musl


EXPOSE 50051

CMD ["./release/helloworld-tonic"]