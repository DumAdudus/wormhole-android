apk: translation
	# cd android && ./gradlew wrapper --gradle-version=8.14
	# flutter doctor -v
	flutter build apk --target-platform android-arm64 --split-per-abi --release 

container-apk:
	docker run --name=wormhole-android \
		--mount type=bind,source=${PWD},target=/root/wormhole/ \
		-v gradle-cache:/root/.gradle \
		-v flutter-cache:/root/.pub-cache \
		-v cargo-cache:/root/.cargo \
		flutter-rust:0430 \
		bash -c "cd /root/wormhole && make clean apk"

linux: translation
	flutter build linux

codegen:
	~/.cargo/bin/flutter_rust_bridge_codegen generate

deploy:
	fastlane deploy

elevate:
	fastlane elevate

translation: get-dep
	flutter gen-l10n

format:
	cd native && cargo fmt
	dart format .

lint:
	cd rust && cargo clippy
	flutter analyze .

clean:
	flutter clean

.PHONY: all apk linux get-dep codegen lint clean

# Proto generation (calls terminal proto commands)
get-dep:
	flutter packages get
