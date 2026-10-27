FROM cypress/included:16.1.1

WORKDIR /e2e

COPY package*.json ./

RUN npm ci

COPY . .

ENTRYPOINT ["npm", "test"]

