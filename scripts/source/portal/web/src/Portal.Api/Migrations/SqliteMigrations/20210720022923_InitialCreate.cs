using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Portal.Api.Migrations.SqliteMigrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false, defaultValueSql: "NEWID()"),
                    Login = table.Column<string>(type: "TEXT", maxLength: 25, nullable: false),
                    Password = table.Column<string>(type: "TEXT", maxLength: 25, nullable: false),
                    LastLoginDate = table.Column<DateTimeOffset>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Accounts",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false, defaultValueSql: "NEWID()"),
                    UserId = table.Column<Guid>(type: "TEXT", nullable: false),
                    AccountNo = table.Column<string>(type: "TEXT", nullable: false),
                    IsActive = table.Column<bool>(type: "INTEGER", nullable: false, defaultValue: true),
                    PrevMonthClosingBalance = table.Column<decimal>(type: "TEXT", precision: 12, scale: 2, nullable: false, defaultValueSql: "0.00"),
                    CurrentBalance = table.Column<decimal>(type: "TEXT", precision: 12, scale: 2, nullable: false, defaultValueSql: "0.00")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Accounts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Accounts_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Profiles",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "TEXT", nullable: false),
                    FirstName = table.Column<string>(type: "TEXT", maxLength: 25, nullable: false),
                    LastName = table.Column<string>(type: "TEXT", maxLength: 25, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Profiles", x => x.UserId);
                    table.ForeignKey(
                        name: "FK_Profiles_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false, defaultValueSql: "NEWID()"),
                    AccountId = table.Column<Guid>(type: "TEXT", nullable: false),
                    XtnDate = table.Column<DateTimeOffset>(type: "TEXT", nullable: false),
                    XtnType = table.Column<int>(type: "INTEGER", nullable: false),
                    PostedBalance = table.Column<decimal>(type: "TEXT", precision: 12, scale: 2, nullable: false, defaultValueSql: "0.00")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Transactions_Accounts_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Accounts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "LastLoginDate", "Login", "Password" },
                values: new object[] { new Guid("b88ebde1-9650-4468-a930-689b116fb5e3"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "dmelamed3244", "(Pass@word)1234!" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "LastLoginDate", "Login", "Password" },
                values: new object[] { new Guid("4a7beb92-d4a9-4db1-83f8-eb0facb780e0"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "tniu5629", "(Pass@word)5678!" });

            migrationBuilder.InsertData(
                table: "Accounts",
                columns: new[] { "Id", "AccountNo", "IsActive", "UserId" },
                values: new object[] { new Guid("5daf5fd9-2db7-4043-a967-6c5bd111288d"), "686847363244", true, new Guid("b88ebde1-9650-4468-a930-689b116fb5e3") });

            migrationBuilder.InsertData(
                table: "Accounts",
                columns: new[] { "Id", "AccountNo", "IsActive", "UserId" },
                values: new object[] { new Guid("f14f3aa3-6e84-47e9-88f7-0ffb99539b2c"), "815571025629", true, new Guid("4a7beb92-d4a9-4db1-83f8-eb0facb780e0") });

            migrationBuilder.InsertData(
                table: "Profiles",
                columns: new[] { "UserId", "FirstName", "LastName" },
                values: new object[] { new Guid("b88ebde1-9650-4468-a930-689b116fb5e3"), "Daniel", "Melamed" });

            migrationBuilder.InsertData(
                table: "Profiles",
                columns: new[] { "UserId", "FirstName", "LastName" },
                values: new object[] { new Guid("4a7beb92-d4a9-4db1-83f8-eb0facb780e0"), "Ting", "Niu" });

            migrationBuilder.CreateIndex(
                name: "IX_Accounts_UserId",
                table: "Accounts",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Transactions_AccountId",
                table: "Transactions",
                column: "AccountId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Profiles");

            migrationBuilder.DropTable(
                name: "Transactions");

            migrationBuilder.DropTable(
                name: "Accounts");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
