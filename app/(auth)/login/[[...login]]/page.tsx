export default function LoginPage(){
return(
    <main className="flex flex-col items-center p-5 gap-10 animate-fade-in">
        <Image
            src='/assets/slotify.svg'
            width={300}
            height={300}
            alt="Logo"
        />

        <div className="mt-3">
            <SignIn signUpUrl="/sign-up" />
        </div>
    </main>
)
}
