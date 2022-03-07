build-push:
	docker build -t lflfm/flutter:latest -f Dockerfile .
	docker push lflfm/flutter:latest
