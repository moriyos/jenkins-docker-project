FROM node:20-alpine

WORKDIR /app

COPY package.json ./

RUN npm ci --omit=dev

COPY . .

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD node -e "fetch('http://localhost:8000/health').then(res => process.exit(res.ok ? 0 : 1)) .catch(() => process.exit(1));"

CMD [ "node", "app.js" ] 