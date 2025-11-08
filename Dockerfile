# Use the official .NET runtime image for production
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Use SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out

# Final stage / runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/out .

# Tell Railway which port to use
ENV ASPNETCORE_URLS=http://+:8080
ENV PORT=8080

ENTRYPOINT ["dotnet", "WanderScape.dll"]
