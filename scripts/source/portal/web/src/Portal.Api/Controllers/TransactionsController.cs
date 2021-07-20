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
    public class TransactionsController : ControllerBase
    {
        private readonly ILogger<TransactionsController> _logger;
        private readonly PortalContext _context;

        public TransactionsController(ILogger<TransactionsController> logger, PortalContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet]
        public IQueryable<Transaction> Get(string acct)
        {
            var xtns = _context.Transactions.Where(t => t.AccountId == Guid.Parse(acct));

            return xtns;
        }
    }
}
