FROM node:14.17-alpine


# Installs latest Chromium (89) package.
RUN apk add --no-cache \
	chromium \
	nss \
	freetype \
	harfbuzz \
	ca-certificates \
	ttf-freefont \
	nodejs \
	yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
	PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /app
COPY . .


RUN yarn install --production

# Puppeteer v6.0.0 works with Chromium 89.
RUN yarn add puppeteer@6.0.0



CMD ["node", "src/index.js"]
