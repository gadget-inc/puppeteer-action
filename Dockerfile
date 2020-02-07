FROM node:13.7.0

LABEL "com.github.actions.name"="Puppeteer Container"
LABEL "com.github.actions.description"="A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="green"

LABEL "repository"="http://github.com/gadget-inc/puppeteer-action"
LABEL "homepage"="http://github.com/gadget-inc/puppeteer-action"
LABEL "maintainer"="Ian Walter <public@iankwalter.com>"

RUN  apt-get update \
     # See https://crbug.com/795759
     && apt-get install -yq sudo libgconf-2-4 \
     # Install latest chrome dev package, which installs the necessary libs to
     # make the bundled version of Chromium that Puppeteer installs work.
     && apt-get install -y wget --no-install-recommends \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y google-chrome-unstable --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

# Run everything after as non-privileged user.
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
  && mkdir -p /home/pptruser/Downloads \
  && chown -R pptruser:pptruser /home/pptruser

# When installing Puppeteer through npm, instruct it to not download Chromium.
# Puppeteer will need to be launched with:
#   browser.launch({ executablePath: 'google-chrome-unstable' })
# This is done by default in @ianwalter/bff.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
