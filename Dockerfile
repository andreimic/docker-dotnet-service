FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /opt/app

COPY src/*.csproj ./
RUN dotnet restore
