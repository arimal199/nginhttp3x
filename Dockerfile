FROM debian:bookworm-slim as build

WORKDIR /build

COPY build.sh /build.sh

RUN bash /build.sh

# FROM build as mid

# WORKDIR /build

# RUN 

FROM nginx:bookworm

# COPY --chown=nginx:nginx ./libc6.deb /tmp

COPY --from=build --chown=nginx:nginx /build/nginx.deb /tmp


# COPY --chown=nginx:nginx ./libmaxminddb0.deb /tmp

# RUN \
#   apt-get install \
#   /tmp/libmaxminddb0.deb \
# #   /tmp/libc6.deb \
#   /tmp/nginx.deb \
# #   dpkg -i /tmp/nginx.deb \
# #   && rm /tmp/nginx.deb 
#   && rm /tmp/*.deb 