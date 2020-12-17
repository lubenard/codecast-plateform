FROM node:10
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
ENV HOST=0.0.0.0
#ENV PORT=5555 <- if want to change port
ENTRYPOINT npm run dev --host
EXPOSE 5000
# FOR PROD --> npm run build && npm run start 