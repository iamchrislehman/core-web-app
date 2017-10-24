FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /core-web-app

# Copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore

# Copy everything else and build
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /core-web-app
#ENTRYPOINT ["dotnet", "core-web-app.dll"]