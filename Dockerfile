FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster


COPY file/Microsoft365_E5_Renew_X.zip /Microsoft365_E5_Renew_X.zip

RUN apt update \
    && apt install -y wget unzip\
    && unzip /Microsoft365_E5_Renew_X.zip -d /renewx 
#     && rm -rf /Microsoft365_E5_Renew_X.zip

RUN dotnet dev-certs https --clean
RUN dotnet dev-certs https

EXPOSE 1066

WORKDIR /renewx

# CMD pwd && ls -al && dotnet Microsoft365_E5_Renew_X.dll

CMD bash

# ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
