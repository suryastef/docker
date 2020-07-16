FROM debian as build
RUN apt-get update && apt-get install build-essential libssl-dev git -y
RUN cd /tmp && git clone https://github.com/wg/wrk.git
RUN cd /tmp/wrk && make

FROM debian:buster-slim
COPY --from=build /tmp/wrk/wrk /usr/local/bin
ENTRYPOINT ["wrk"]