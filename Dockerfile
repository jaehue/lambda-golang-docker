FROM public.ecr.aws/lambda/provided:al2 as build
LABEL version="20230717"
# install compiler
RUN yum install -y golang
RUN go env -w GOPROXY=direct
# cache dependencies
WORKDIR /go/src/github.com/hithereco/hithere-backend
ADD go.mod go.sum ./
RUN go mod download
