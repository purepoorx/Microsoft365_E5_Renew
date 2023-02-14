FROM mcr.microsoft.com/dotnet/aspnet:3.1


COPY file/Microsoft365_E5_Renew_X.zip Microsoft365_E5_Renew_X.zip

RUN apt update \
    && apt install -y wget unzip\
    && unzip Microsoft365_E5_Renew_X.zip -d /renewx \
    && rm -rf Microsoft365_E5_Renew_X.zip


EXPOSE 1066

WORKDIR /renewx

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
