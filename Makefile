NAME=ros_container

run: build
	xhost +
	docker run \
		-e "DISPLAY=:0" \
		-v ${PWD}/ws:/ws \
		-w /ws \
		--privileged \
		--network host \
		-it ${NAME}

build:
	docker build -t ${NAME} .

