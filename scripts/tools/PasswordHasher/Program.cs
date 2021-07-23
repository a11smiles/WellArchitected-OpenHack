using System;
using Microsoft.AspNetCore.Identity;

namespace PasswordHasher
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter password: ");
            var password = Console.ReadLine();

            var passwordHasher = new PasswordHasher<string>();
            var hash = passwordHasher.HashPassword(null, password);
            Console.WriteLine("Hash: " + hash);
            Console.WriteLine();
        }
    }
}
