// pages/api/user.js
import { getServerSession } from "next-auth/next";
import { authOptions } from "../../lib/auth";
import prisma from "../../lib/prisma";
import { deriveUserSalt } from "../../lib/salt";
// @ts-ignore
import { jwtToAddress } from "@mysten/zklogin";

export default async function handler(req, res) {
	try {
		const session = await getServerSession(authOptions, req, res);

		let address = null;
		if (session !== null && session.user) {
			const email = session.user.email; // Removed type assertion

			// get the user from the database
			const user = await prisma.user.findUnique({
				where: {
					email,
				},
			});

			// get the account from the database
			const account = await prisma.account.findFirst({
				where: {
					userId: user?.id,
				},
			});

			// get the id_token from the account
			const id_token = account?.id_token;

			// get the salt from the id_token
			const salt = deriveUserSalt(id_token);

			// get the address from the id_token and salt
			address = jwtToAddress(id_token, salt);
		}

		res.status(200).json({ session, address });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
}
