import { PrismaClient } from "@prisma/client";

declare global {
  var prisma: PrismaClient | undefined;
}

let prisma = null

// const prisma = global.prisma || new PrismaClient();
export async function getStaticProps() {
  prisma = new PrismaClient()

  return {
    props : { }
  }
}

if (process.env.NODE_ENV === "development") global.prisma = prisma;

export default prisma;
