# Use the official image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8085

# Use SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ValidationService/ValidationService.csproj", "ValidationService/"]
RUN dotnet restore "ValidationService/ValidationService.csproj"
COPY . .
WORKDIR "/src/ValidationService"
RUN dotnet build "ValidationService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ValidationService.csproj" -c Release -o /app/publish

# Copy the build artifacts from the previous stage to the final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ValidationService.dll"]
