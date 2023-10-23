import { authOptions } from "../lib/auth";
import  {unstable_getServerSession} from "next-auth/next";
import Navbar from "./navbar";

export default async function Nav() {
  const session = await unstable_getServerSession(authOptions);
  return <Navbar session={session} />;
}
