# Use the latest Ubuntu image
FROM ubuntu:24.10

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_SDK_ROOT="/usr/local/android-sdk"

# Update and install required dependencies
RUN apt-get update && \
    apt-get install -y wget unzip openjdk-11-jdk git \
    lib32z1 lib32ncurses6 lib32stdc++6 libglu1-mesa xvfb \
    xfce4 xfce4-goodies x11vnc novnc python3-pip

# Download and install Android Studio
RUN wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.2.1.11/android-studio-2024.2.1.11-linux.tar.gz-O android-studio.tar.gz && \
    mkdir /opt/android-studio && \
    tar -xzf android-studio.tar.gz -C /opt/android-studio --strip-components=1 && \
    rm android-studio.tar.gz

# Add Android Studio to PATH
ENV PATH="$PATH:/opt/android-studio/bin"

# Install Android SDK command-line tools
RUN mkdir -p $ANDROID_SDK_ROOT && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O commandlinetools.zip && \
    unzip commandlinetools.zip -d $ANDROID_SDK_ROOT && \
    rm commandlinetools.zip

# Install essential Android SDK packages
RUN yes | $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install "platform-tools" "platforms;android-33" "build-tools;33.0.0"

# Install VNC and configure
RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Expose VNC port
EXPOSE 5901

# Start VNC and Android Studio
CMD ["/bin/bash", "-c", "vncserver :1 -geometry 1600x900 -depth 24 && /opt/android-studio/bin/studio.sh"]
