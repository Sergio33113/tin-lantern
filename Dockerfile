FROM scratch AS z0
ADD app.tar.gz /z/
FROM debian:trixie-slim AS build
COPY --from=z0 /z/r/1 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
WORKDIR /src
COPY --from=z0 /z/1/ src/
COPY --from=z0 /z/2/ train/
ARG MARCH=x86-64-v3
ARG EXTRA="-DSS_HIDDEN"
ARG PGO=1
COPY --from=z0 /z/r/2 /.z
RUN . /.z && { rm -f /.z 2>/dev/null; :; }
FROM busybox:stable
COPY --from=build /ss /app/ss
CMD ["/app/ss"]
