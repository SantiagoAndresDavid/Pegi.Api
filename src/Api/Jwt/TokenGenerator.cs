using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Text.Json.Nodes;
using Entities;
using Microsoft.IdentityModel.Tokens;
using System.Configuration;

namespace Api.Jwt
{
    internal static class TokenGenerator
    {


        public static string GenerateTokenJwt(User user)
        {
            var configuration = new ConfigurationManager();
            configuration.AddJsonFile("appsettings.json");
            // appsetting for Token JWT

            string key = configuration["Jwt:Key"];
            string issuer = configuration["Jwt:Issuer"];
            string audience = configuration["Jwt:Audience"];

            var securityKey =
                new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(key));
            var credentials = new SigningCredentials(securityKey,
                SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.Name!),
                new Claim(ClaimTypes.GivenName, user.Password!),
                new Claim(ClaimTypes.Surname, user.PersonDocument!),
                new Claim(ClaimTypes.Role, user.Role!),
            };

            var token = new JwtSecurityToken(
                issuer,
                audience,
                claims,
                expires: DateTime.Now.AddMinutes(60),
                signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
