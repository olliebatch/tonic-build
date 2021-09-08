FROM amd64/rust:1.54

WORKDIR /usr/src/myapp
COPY . .

RUN rustup component add rustfmt

RUN cargo build --release

EXPOSE 50051

CMD ["./target/release/helloworld-tonic"]