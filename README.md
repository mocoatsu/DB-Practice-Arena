# DB-PRACTICE-ARENA

1. Run Docker MySQL Container:
```bash
docker-compose up -d
```

2. Run DB Migrations with Prisma 
```bash
npx prisma migrate dev
```

3. Enter the MySQL Container and Manipulate MySQL Console
```bash
npm run docker:mysql
``` 