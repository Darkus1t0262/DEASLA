# Use the official image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8085

# Use SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy all files from the current directory to /src in the container
  # This will copy everything in the build context
COPY . .

# Restore dependencies
RUN dotnet restore "validation-service.csproj"

# Build the app
RUN dotnet build "validation-service.csproj" -c Release -o /app/build

# Publish the app
FROM build AS publish
RUN dotnet publish "validation-service.csproj" -c Release -o /app/publish

# Copy the build artifacts from the previous stage to the final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Define the entrypoint
ENTRYPOINT ["dotnet", "validation-service.dll"]
