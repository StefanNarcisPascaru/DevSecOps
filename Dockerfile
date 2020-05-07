FROM jenkins/jenkins:lts
 # Install .NET Core SDK
USER root
RUN  mkdir -p /jenkins
WORKDIR /jenkins

ENV DOTNET_CORE_SDK_VERSION 3.1
RUN   curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/jenkins/microsoft.gpg
RUN   mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN   sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN   apt-get update
RUN   apt-get install dotnet-sdk-3.1 -y