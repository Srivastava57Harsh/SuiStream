// import { authOptions } from "../lib/auth";
// import  {getServerSession} from "next-auth/next";
// import Navbar from "./navbar";

// export default async function Nav() {
//   const session = await getServerSession(authOptions);
  
//   return <Navbar session={session} />;
// }


// // import { useState, useEffect } from "react";
// // import { authOptions } from "../lib/auth";
// // import { getServerSession } from "next-auth/next";
// // import { Session } from "next-auth/index";
// // import Navbar from "./navbar";

// // export default function Nav() {
// //   const [session, setSession] = useState<Session | null>(null);

// //   useEffect(() => {
// //     const fetchSession = async () => {
// //       const serverSession: Session | null = await getServerSession(authOptions);
// //       setSession(serverSession);
// //     };

// //     fetchSession();
// //   }, []); // Empty dependency array means this effect runs once on mount

// //   return <Navbar session={session} />;
// // }

