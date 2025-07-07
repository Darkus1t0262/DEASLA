FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8084

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project files into the container
COPY . .

# Restore dependencies
RUN dotnet restore

# Publish the application
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app

# Copy the published files from the build stage
COPY --from=build /app/publish ./

# List files to verify the DLL is copied
RUN ls -l /app

# Set entry point to the correct DLL
ENTRYPOINT ["dotnet", "template-service.dll"]
