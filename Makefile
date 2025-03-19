apk: translation
	# cd android && ./gradlew wrapper --gradle-version=8.12.1
	# flutter doctor -v
	flutter build apk --split-per-abi --release --target-platform android-arm64

container-apk:
	docker run --name=wormhole-android \
		--mount type=bind,source=${PWD},target=/root/wormhole/ \
		-v gradle-cache:/root/.gradle \
		-v flutter-cache:/root/.pub-cache \
		flutter-rust:0319 \
		bash -c "cd /root/wormhole && make clean apk"

linux: translation
	flutter build linux

codegen:
	/home/lukas/.cargo/bin/flutter_rust_bridge_codegen \
	--rust-input native/src/api.rs \
	--dart-output lib/gen/bridge_generated.dart \
	--c-output ios/Runner/bridge_generated.h \
	--dart-decl-output lib/gen/bridge_definitions.dart \
	--wasm

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
	cd native && cargo clippy
	flutter analyze .

clean:
	flutter clean
	cd native && cargo clean

.PHONY: all apk linux get-dep codegen lint clean

# Proto generation (calls terminal proto commands)
get-dep:
	flutter packages get
