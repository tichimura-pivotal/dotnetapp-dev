FROM microsoft/dotnet:1.0-sdk-projectjson
WORKDIR /app

# copy project.json and restore as distinct layers
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
RUN dotnet publish -c Release -o out
#ENTRYPOINT ["dotnet", "out/dotnetapp.dll"]
