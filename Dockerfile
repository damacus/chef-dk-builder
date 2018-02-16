FROM docker:stable-git
ARG VERSION=2.4.17
ARG VERSION_PATCH=2.4.17-1

ENV BUILD_PACKAGES bash curl curl-dev build-base libffi-dev ca-certificates openssl git

RUN apk add --no-cache $BUILD_PACKAGES            &&\
    update-ca-certificates                        &&\
    mkdir /project

RUN curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | bash &&\
    hab pkg install chef/chef-dk                                                                      &&\
    hab pkg binlink chef/chef-dk chef-dk

WORKDIR /project

ARG PROJECT=unknown
ARG DATE=unknown
ARG DESCRIPTION=unknown
ARG URL=unknown
ARG COMMIT=unknown

LABEL "io.damacus.title"=$PROJECT            \
     "io.damacus.created"=$DATE             \
     "io.damacus.description"=$DESCRIPTION  \
     "io.damacus.url"=$URL                  \
     "io.damacus.revision"=$COMMIT

CMD ["/bin/bash"]
