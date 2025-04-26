FROM node:20-alpine

WORKDIR /app

# create-next-app をグローバルにインストール
RUN npm install -g create-next-app

CMD ["sh", "-c", "\
  if [ ! -f next/package.json ]; then \
    create-next-app next --yes && \
    cd next && \
    npm install prisma --save-dev && \
    npm install @prisma/client && \
    npm install next-auth @next-auth/prisma-adapter && \
    npm install lucia lucia-auth @lucia-auth/adapter-prisma @lucia-auth/nextjs && \
    npx prisma init; \
  fi && \
  cd next && npm run dev \
"]
