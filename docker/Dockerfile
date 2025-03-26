FROM ghcr.io/cirruslabs/flutter:3.27.1

ENV ANDROID_NDK_VERSION 27.2.12479018
ENV PATH="/root/.cargo/bin:$PATH"
ENV ANDROID_NDK_HOME=/opt/android-sdk-linux/ndk/$ANDROID_NDK_VERSION

RUN yes | sdkmanager "ndk;$ANDROID_NDK_VERSION" \
    "cmake;3.22.1" \
    "build-tools;30.0.3" \
    "build-tools;33.0.1" \
    "build-tools;35.0.0" \
    "platforms;android-31" \
    "platforms;android-33" \
    "platforms;android-35"

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --profile minimal --target aarch64-linux-android \
    && . "$HOME/.cargo/env" \
    && cargo install cargo-ndk flutter_rust_bridge_codegen cargo-expand

VOLUME /root/.pub-cache /root/.gradle