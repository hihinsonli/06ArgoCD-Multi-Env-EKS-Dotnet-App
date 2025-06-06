# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore dependencies
COPY ["dotnet-app.csproj", "."]
RUN dotnet restore "dotnet-app.csproj"

# Copy the rest of the code
COPY . .
RUN dotnet build "dotnet-app.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "dotnet-app.csproj" -c Release -o /app/publish

# Final stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Set environment variables
ENV ASPNETCORE_URLS=http://+:5000
ENV ASPNETCORE_ENVIRONMENT=Production

# Expose port
EXPOSE 5000

# Start the application
ENTRYPOINT ["dotnet", "dotnet-app.dll"] 