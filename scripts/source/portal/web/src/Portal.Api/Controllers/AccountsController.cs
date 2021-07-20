using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Portal.Data;
using Portal.Data.Entities;

namespace Portal.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AccountsController : ControllerBase
    {
        private readonly ILogger<AccountsController> _logger;
        private readonly PortalContext _context;

        public AccountsController(ILogger<AccountsController> logger, PortalContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet]
        public Account Get()
        {
            var account = _context.Accounts.SingleOrDefault(u => u.UserId == Guid.NewGuid());

            return account;
        }
    }
}
