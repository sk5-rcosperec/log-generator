FROM --platform=$BUILDPLATFORM golang:1.19-alpine AS build
WORKDIR /src
ARG TARGETOS TARGETARCH
RUN --mount=target=. \
    --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg \
    GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /out/myapp .

FROM --platform=$TARGETPLATFORM alpine
COPY --from=build /out/myapp /log-generator

CMD /log-generator --logtostderr \
  --log-lines-total=${LOGS_GENERATOR_LINES_TOTAL} \
  --run-duration=${LOGS_GENERATOR_DURATION} \
  --mode=${LOGS_GENERATOR_MODE}