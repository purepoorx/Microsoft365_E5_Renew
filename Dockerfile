FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS ontology

WORKDIR /renewx

COPY file/Microsoft365_E5_Renew_X.zip Microsoft365_E5_Renew_X.zip

RUN apt update \
    && apt install -y wget unzip\
    && unzip Microsoft365_E5_Renew_X.zip -d /renewx \
    && rm -rf Microsoft365_E5_Renew_X.zip

FROM mcr.microsoft.com/dotnet/aspnet:3.1

ENV LANG=zh_CN.UTF-8

WORKDIR /renewx

EXPOSE 1066

COPY --from=ontology /renewx /renewx

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
