FROM haskell:7
WORKDIR /opt/server
# Do these next two lines because BOY does the install take a long time
COPY microservice.cabal.initial ./microservice.cabal
COPY stack.yaml.initial ./stack.yaml
COPY Main.hs.initial ./src/Main.hs
# Do the install the first time
RUN stack install
COPY . /opt/server
# Now hopefully install any new things
RUN stack install
# ENTRYPOINT ["pandoc"]
CMD stack ghci
