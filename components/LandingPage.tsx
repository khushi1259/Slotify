'use client'
import { SignIn } from "@clerk/nextjs"
import { neobrutalism } from "@clerk/themes"
import Image from "next/image"
import Link from "next/link"

export default function LandingPage() {
    return (
        <main className="flex flex-col items-center p-10 gap-16 animate-fade-in max-md:flex-col">

            {/* Branding Section */}
            <section className="flex flex-col items-center text-center">

                <Image
                    src='/assets/slotify.svg'
                    width={250}
                    height={250}
                    alt="Slotify Logo"
                />

                <h1 className="text-3xl font-black mt-4">
                    Your Time, Perfectly Planned
                </h1>

                <p className="font-extralight max-w-lg mt-2">
                    Join professionals who easily book meetings with Slotify — a modern scheduling platform built with Next.js.
                </p>

                <Image
                    src='/assets/planning.svg'
                    width={400}
                    height={400}
                    alt="Planning Illustration"
                    className="mt-6"
                />
            </section>

            {/* Clerk Sign In */}
            <div>
                <SignIn
                    routing="hash"
                    appearance={{
                        baseTheme: neobrutalism,
                    }}
                />
            </div>

            {/* Privacy + Terms Links (IMPORTANT FOR GOOGLE) */}
            <div className="flex gap-6 text-sm text-gray-600 mt-8">
                <Link href="/privacy" className="hover:underline">
                    Privacy Policy
                </Link>

                <Link href="/terms" className="hover:underline">
                    Terms of Service
                </Link>
            </div>

        </main>
    )
}