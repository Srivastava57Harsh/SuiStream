"use client";

import useScroll from "../../lib/hooks/use-scroll";
import { Session } from "next-auth";
import Image from "next/image";
import Link from "next/link";
import { Google } from "../icons";
import Scale3 from "../icons/scale3.svg";
import { useSignInModal } from "../sign-in-modal";
import UserDropdown from "../user-dropdown";
import React, { useState } from "react";
import { useAddress } from "@thirdweb-dev/react";
import UserMenu from "./UserMenu";
import ConnectMetamask from "./ConnectMetamask";
import { useRecoilValue } from "recoil";
import { currentUserState } from "../../recoil/states";
import CreateProfile from "./CreateProfile";
import ConnectSui from "./ConnectMetamask";

// const Header = () => {
//   const currentUserAddress = useAddress();
//   const [createProfileModal, setCreateProfileModal] = useState<boolean>(false);
//   const currentUser = useRecoilValue(currentUserState);

//   return (
//     <>
//       <header className="sticky z-20  bg-gray-900 top-0 left-0 border-b border-gray-700">
//         <nav className="py-3 px-4 flex justify-between items-center">
//           <div className=" flex items-center gap-3  ">
//             <Link href="/">
//               <img
//                 src="/logo.svg"
//                 alt="logo"
//                 className="hover:scale-110 duration-300 ease-out cursor-pointer "
//               />
//             </Link>
//             <h1 className="font-display font-bold text-2xl ">Sui Stream</h1>
//           </div>
//           <div className="flex gap-3 items-center ">
//             {!currentUser.loading && !currentUser.hasProfile && (
//               <Link href="/signup">
//                 <button className="bg-violet-600 hover:bg-violet-500">
//                   Create Profile
//                 </button>
//               </Link>
//             )}
//             {!currentUserAddress && !currentUser.hasProfile ? (
//               <ConnectSui />
//             ) : (
//               <UserMenu />
//             )}
//           </div>
//         </nav>
//       </header>
//     </>
//   );
// };

// export default Header;

export default function Header({ session }: { session: Session | null }) {
  const { SignInModal, setShowSignInModal } = useSignInModal();
  const scrolled = useScroll(50);

  return (
    <>
      <SignInModal />
      <div
        className={`fixed top-0 w-full flex justify-center ${
          scrolled
            ? "border-b border-gray-200 bg-white/50 backdrop-blur-xl"
            : "bg-white/0"
        } z-30 transition-all`}
      >
        <div className="mx-5 flex h-16 max-w-screen-xl items-center justify-between w-full">
          <div className="flex items-center font-display text-2xl">
            
          </div>
          <div>
            {session ? (
              <UserDropdown session={session} />
            ) : (
              <button
                className="flex gap-2 items-center rounded-full border border-gray-300 p-1.5 px-4 text-sm transition-all bg-gradient-to-tr from-blue-400 via-white to-purple-400 background-animate"
                onClick={() => setShowSignInModal(true)}
              >
                <Google className="h-1 w-1" />
                Get Started
              </button>
            )}
          </div>
        </div>
      </div>
    </>
  );
}
