FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["Gateway.Main/Gateway.Main.csproj", "Gateway.Main/"]
RUN dotnet restore "Gateway.Main/Gateway.Main.csproj"
COPY . .
WORKDIR "/src/Gateway.Main"
RUN dotnet build "Gateway.Main.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Gateway.Main.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Gateway.Main.dll"]
