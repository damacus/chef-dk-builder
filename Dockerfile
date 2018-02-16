FROM docker:stable-git

RUN apk add --no-cache bash curl                                                                      &&\
    curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | bash &&\
    hab pkg install --binlink core/curl core/openssl core/git core/cacerts core/libffi                &&\
    update-ca-certificates
RUN hab pkg install thom/chef-dk -c unstable --binlink --force

RUN mkdir /project
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
