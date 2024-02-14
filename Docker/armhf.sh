#!/bin/bash

WORKDIR="${WORKDIR:-${HOME}}"

case "${1}" in
	run)
		docker run -it \
			--network=host \
			-v ${WORKDIR}:/home/build \
			-w /home/build \
			-u $(id -u):$(id -g) \
			--hostname cmtp-responder-build \
			cmtp-responder-build:armhf
		;;
	build)
		docker buildx build --target cmtp-responder-build-armhf \
			-t cmtp-responder-build:armhf \
			.
		;;
	*)
		echo "Usage: $0 {run|build}"
		exit 1
esac