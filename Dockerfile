FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /opt/app

COPY src/*.csproj ./
RUN dotnet restore

COPY src/ .
RUN dotnet publish -c Release -o publish

FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /opt/app
COPY --from=build /opt/app/publish ./
ENTRYPOINT ["dotnet", "ValuesService.dll"]
